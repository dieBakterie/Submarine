from fileinput import filename
import logging, os, shutil, argparse, subprocess, json
from datetime import datetime

# Basis-Verzeichnisse und Versionskonstanten
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
VERSIONS = ['1.21.1', '1.21.2']

# Cache für Basisverzeichnisse
_base_dirs_cache = None

def get_base_dirs():
    global _base_dirs_cache
    if _base_dirs_cache is None:
        _base_dirs_cache = {
            'input': create_path('templates'),
            'output': create_path('submarine'),
            'logs': create_path('logs'),
            'functions': create_path('templates', 'functions'),
            'recipes_input': create_path('templates', 'recipes'),
            'recipes_output': create_path('submarine', 'recipe'),
            'recipe_logs': create_path('logs', 'recipe'),
            'removes_input': create_path('templates', 'functions', 'remove'),
            'removes_output': create_path('submarine', 'function', 'remove'),
            'remove_logs': create_path('logs', 'remove'),
            'animations_input': create_path('templates', 'functions', 'animations'),
            'animations_output': create_path('submarine', 'function', 'animations'),
            'animation_logs': create_path('logs', 'animations'),
            'spawns_input': create_path('templates', 'functions', 'spawn'),
            'spawns_output': create_path('submarine', 'function', 'spawn'),
            'spawn_logs': create_path('logs', 'spawn'),
            'models_input': create_path('templates', 'models'),
            'models_output': create_path('submarine', 'model'),
            'model_logs': create_path('logs', 'model'),
            'clean_logs': create_path('logs', 'clean'),
            'debug_logs': create_path('logs', 'debug')
        }
    return _base_dirs_cache

# Funktion, die direkt Zugriff auf ein spezifisches Verzeichnis bietet
def get_base_dir(key):
    """
    Returns the base directory path corresponding to the provided key.

    Args:
        key (str): The key to retrieve the base directory path.

    Returns:
        str: The path to the base directory corresponding to the key.
    """
    base_dirs = get_base_dirs()
    return base_dirs.get(key)

# Farben und Hex-Codes
COLORS = {
    'black': '#000000',
    'blue': '#0000AA',
    'brown': '#AA5500',
    'cyan': '#00AAAA',
    'gray': '#AAAAAA',
    'green': '#00AA00',
    'light_blue': '#55FFFF',
    'light_gray': '#AAAAAA',
    'lime': '#55FF55',
    'magenta': '#FF55FF',
    'orange': '#FFAA00',
    'pink': '#FFAAFF',
    'purple': '#AA00AA',
    'red': '#FF5555',
    'white': '#FFFFFF',
    'yellow': '#FFFF55',
}

def dir_exists(dir_path):
    """
    Checks if the given directory exists.

    Args:
        dir_path (str): The path to the directory to check.

    Returns:
        bool: True if the directory exists, False otherwise.
    """
    return os.path.exists(dir_path)

def file_exists(file_path):
    """
    Checks if the given file exists.

    Args:
        file_path (str): The path to the file to check.

    Returns:
        bool: True if the file exists, False otherwise.
    """
    return os.path.exists(file_path)

def create_path(*args):
    """
    Creates a path by joining the given arguments to the base directory of the
    project.

    Args:
        *args (str): The path components to join.

    Returns:
        str: The created path.
    """
    return os.path.join(BASE_DIR, *args)

def create_dir(dir_path):
    """
    Creates a new directory at the given path.

    Args:
        dir_path (str): The path to the directory to create.

    Returns:
        The created directory path.
    """
    return os.makedirs(dir_path, exist_ok=True)

def create_file(file_path):
    """
    Creates a new empty file at the given path.

    Args:
        file_path (str): The path to the file to create.

    Returns:
        int: The number of characters written to the file (0).
    """
    with open(file_path, 'w') as file:
        return file.write('')

def delete_dir(dir_path):
    """
    Deletes a directory and all of its contents.

    Args:
        dir_path (str): The path to the directory to delete.
    """
    return shutil.rmtree(dir_path)

def get_versioned_dirs(base, subdir):
    """
    Generates a dictionary of all versioned directories in the given base directory
    with the given subdirectory.

    Args:
        base (str): The base directory.
        subdir (str): The subdirectory.

    Returns:
        dict: A dictionary with the version as the key and the path to the versioned
              directory as the value.
    """
    return {version: create_path(base, subdir, version) for version in VERSIONS}

def save_file(content, file_path):
    """
    Saves a string to a file.

    Args:
        content (str): The string to save to the file.
        file_path (str): The path to the file to save the content to.

    Returns:
        int: The number of characters written to the file.
    """
    with open(file_path, 'w') as file:
        return file.write(content)

def list_files_in_directory(directory, recursive=False):
    """
    Lists all files in the given directory and its subdirectories.

    Args:
        directory (str): The path to the directory to list files from.
        recursive (bool): Flag to indicate whether to list files recursively.

    Returns:
        list: A list of file paths for all files found in the directory and its subdirectories.
    """
    files = []
    if recursive:
        for dir_path, _, filenames in os.walk(directory):
            for filename in filenames:
                files.append(os.path.join(dir_path, filename))
    else:
        for filename in os.listdir(directory):
            file_path = os.path.join(directory, filename)
            if os.path.isfile(file_path):
                files.append(file_path)
    return files

def get_file_name(file_path):
    """
    Gibt den Dateinamen einer Datei zurück.

    Args:
        file_path (str): Der Pfad zur Datei, von der der Dateiname zurückgegeben werden soll.

    Returns:
        str: Der Dateiname der Datei.
    """
    return os.path.basename(file_path)

def count_files_in_directory(directory, extension=None):
    """
    Zählt die Anzahl der Dateien in einem Verzeichnis und allen Unterordnern.

    Args:
        directory (str): Das Verzeichnis, in dem die Dateien gezählt werden sollen.
        extension (str, optional): Die Dateiendung der Dateien, die gezählt werden
            sollen. Wenn keines angegeben ist, werden alle Dateien gezählt.

    Returns:
        int: Die Anzahl der Dateien.
    """
    total_files = 0
    for _, _, files in os.walk(directory):
        if extension:
            files = [f for f in files if f.endswith(extension)]
        total_files += len(files)
    return total_files

def count_files_in_dirs(dirs, extension=None):
    """
    Zählt die Anzahl der Dateien in mehreren Verzeichnissen.

    Args:
        dirs (list): Eine Liste von Verzeichnissen, in denen die Anzahl der Dateien gezählt werden soll.
        extension (str): Eine optionale Dateiendung, um nur bestimmte Dateien zu zählen. Wenn None, werden alle Dateien gezählt.

    Returns:
        dict: Ein Dictionary mit den Verzeichnissen als Schlüssel und der Anzahl der Dateien als Wert.
    """
    return {dir_path: count_files_in_directory(dir_path, extension) for dir_path in dirs}

# Funktion zum Laden von Vorlagen
def load_template(file_path):
    """
    Lädt eine Datei und gibt ihren Inhalt zurück.
    Falls die Datei nicht existiert, wird ein Fehler geloggt und eine Ausnahme geworfen.

    :param file_path: Der Pfad zur Datei, die geladen werden soll.
    :return: Der Inhalt der Datei als String.
    :raises FileNotFoundError: Falls die Datei nicht gefunden wird.
    """
    if file_exists(file_path):
        with open(file_path, 'r') as file:
            return file.read()
    else:
        # Logge den Fehler, dass die Datei nicht existiert
        log_message(f"Fehler: Vorlage {file_path} nicht gefunden.", level='error')
        raise FileNotFoundError(f"Die Datei {file_path} existiert nicht.")

def replicate_directory_structure(output_dir, relative_path):
    """
    Repliziert die Verzeichnisstruktur vom input_dir im output_dir basierend auf relative_path.
    
    :param output_dir: Wurzelverzeichnis des Output-Verzeichnisses
    :param relative_path: Der relative Pfad der Datei im Input-Verzeichnis
    :return: Der vollständige Pfad des entsprechenden Output-Verzeichnisses
    """
    # Berechne den relativen Pfad vom Input-Verzeichnis zur Datei
    target_dir = create_path(output_dir, relative_path)

    # Stelle sicher, dass der Zielordner existiert
    if not dir_exists(target_dir):
        create_dir(target_dir)

    return target_dir

def log_message(message, level='info'):
    """
    Loggt eine Nachricht mit dem angegebenen Level.

    Args:
        message (str): Die zu loggende Nachricht.
        level (str, optional): Der Log-Level. Standardmaessig 'info'. Defaults to 'info'.
    """
    if level == 'info':
        logging.info(message)
    elif level == 'debug':
        logging.debug(message)
    elif level == 'warning':
        logging.warning(message)
    elif level == 'critical':
        logging.critical(message)
    elif level == 'error':
        logging.error(message)
    else:
        logging.info(message)

def setup_logging(log_directory='logs', log_file_name='minecraft_utils.log'):
    # Dynamischen Dateinamen basierend auf dem aktuellen Datum erstellen
    current_date = datetime.now().strftime('%d-%m-%Y')

    log_directory = get_base_dir(log_directory)

    # Erstelle das Verzeichnis, falls es nicht existiert
    if not dir_exists(log_directory):
        create_dir(log_directory)

    log_file_name = create_path(log_directory, f'{current_date}_{log_file_name}')

    # Konfiguration des Logging
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(levelname)s - %(message)s',
        datefmt='%Y-%m-%d %H:%M:%S',
        filename=log_file_name,
        filemode='w',  # 'w' für Überschreiben, 'a' für Anhängen
    )

def get_dirname(file_path):
    """
    Returns the directory name of the given file path.

    Args:
        file_path (str): The file path.

    Returns:
        str: The directory name.
    """
    return os.path.dirname(file_path)

def ensure_dir_exists(directory):
    """Prüft, ob das Verzeichnis existiert, und erstellt es falls nicht."""
    if not dir_exists(directory):
        log_message(f"Verzeichnis {directory} wird erstellt...", 'warning')
        create_dir(directory)
        log_message(f"Verzeichnis {directory} erfolgreich erstellt.")
    else:
        log_message(f"Verzeichnis {directory} existiert bereits.")

# Hauptfunktion
def main():

    setup_logging()  # Logging initialisieren

    parser = argparse.ArgumentParser(description='Generiere Minecraft-Dateien.')
    parser.add_argument('-a', '--animations', action='store_true', help='Erstellt die Animations-Dateien')
    parser.add_argument('-m', '--models', action='store_true', help='Erstellt die Modell-Dateien')
    parser.add_argument('-r', '--recipes', action='store_true', help='Erstellt die Rezept-Dateien')
    parser.add_argument('--remove', action='store_true', help='Erstellt die Remove-Dateien')
    parser.add_argument('-s', '--spawn', action='store_true', help='Erstellt die Spawn-Dateien')
    parser.add_argument('-d', '--debug', action='store_true', help='Zeigt Debug-Informationen an')
    parser.add_argument('-c', '--clean', action='store_true', help='Löscht alle generierten Dateien')
    parser.add_argument('-v', '--version', action='version', version='1.0', help='Zeigt die Skript-Version an')
    parser.add_argument('-t', '--test', action='store_true', help='Startet die Tests')

    args = parser.parse_args()

    log_message(f"Script started with the following arguments: {args}")

    if args.animations:
        log_message('Generating animation files.')
        subprocess.run(['py', 'generate_animation_files.py'])
    if args.clean:
        log_message('Cleaning up files.')
        subprocess.run(['py', 'clean.py'])
    if args.debug:
        log_message('Running in debug mode.')
        subprocess.run(['py', 'debug.py'])
    if args.models:
        log_message('Generating model files.')
        subprocess.run(['py', 'generate_model_files.py'])
    if args.recipes:
        log_message('Generating recipe files.')
        subprocess.run(['py', 'generate_recipe_files.py'])
    if args.remove:
        log_message('Generating remove files.')
        subprocess.run(['py', 'generate_remove_files.py'])
    if args.spawn:
        log_message('Generating spawn files.')
        subprocess.run(['py', 'generate_spawn_files.py'])
    if args.test:
        log_message('Running tests.')
        setup_logging('logs', 'test.log')
        get_relative_path('spawn_input', 'spawn_output')

if __name__ == "__main__":
    main()
