import argparse, subprocess, os

# Basis-Verzeichnisse und Versionskonstanten
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
VERSIONS = ['1.21.1', '1.21.2']

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

# Funktion zum Erstellen von Pfaden
def create_path(*args):
    return os.path.join(BASE_DIR, *args)

# Generiere alle Basisverzeichnisse
def get_base_dirs():
    return {
        'input': create_path('templates'),
        'output': create_path('submarine'),
        'functions': create_path('templates', 'functions'),
        'recipes_input': create_path('templates', 'recipes'),
        'recipes_output': create_path('submarine', 'recipe'),
        'removes_output': create_path('submarine', 'function', 'remove'),
        'animations_input': create_path('templates', 'functions', 'animations'),
        'animations_output': create_path('submarine', 'function', 'animations'),
        'spawn_input': create_path('templates', 'functions', 'spawn'),
        'spawn_output': create_path('submarine', 'function', 'spawn'),
        'models_input': create_path('templates', 'models'),
        'models_output': create_path('submarine', 'model'),
        'remove_output': create_path('submarine', 'remove')
    }

def get_versioned_dirs(base, subdir):
    return {version: create_path(base, subdir, version) for version in VERSIONS}

# Laden und Speichern von Dateien
def load_template(file_path):
    with open(file_path, 'r') as file:
        return file.read()

def save_file(content, file_path):
    with open(file_path, 'w') as file:
        file.write(content)

def count_files_in_directory(directory):
    total_files = 0
    for _, _, files in os.walk(directory):
        total_files += len(files)
    return total_files

def count_files_in_dirs(dirs):
    return {dir_path: count_files_in_directory(dir_path) for dir_path in dirs}

# Debug-Funktion
def debug():
    print("Base Directories:")
    base_dirs = get_base_dirs()
    for key, value in base_dirs.items():
        print(f'{key}: {value}')
    
    input_dirs_animations = get_versioned_dirs(base_dirs['animations_input'], '')
    input_dirs_spawn = get_versioned_dirs(base_dirs['spawn_input'], '')
    input_dirs_recipes = get_versioned_dirs(base_dirs['recipes_input'], '')
    output_dirs_animations = get_versioned_dirs(base_dirs['animations_output'], '')
    output_dirs_spawn = get_versioned_dirs(base_dirs['spawn_output'], '')
    output_dirs_recipes = get_versioned_dirs(base_dirs['recipes_output'], '')

    print("\nInput Animation Directories:")
    for version, path in input_dirs_animations.items():
        print(f'{version}: {path}')

    print("\nOutput Animation Directories:")
    for version, path in output_dirs_animations.items():
        print(f'{version}: {path}')

    print("\nInput Spawn Directories:")
    for version, path in input_dirs_spawn.items():
        print(f'{version}: {path}')

    print("\nOutput Spawn Directories:")
    for version, path in output_dirs_spawn.items():
        print(f'{version}: {path}')

    print("\nInput Recipe Directories:")
    for version, path in input_dirs_recipes.items():
        print(f'{version}: {path}')

    print("\nOutput Recipe Directories:")
    for version, path in output_dirs_recipes.items():
        print(f'{version}: {path}')

    print("\nFile Count:")
    for version, path in base_dirs.items():
        print(f'{version}: {count_files_in_directory(path)}')

def main():
    parser = argparse.ArgumentParser(description='Generiere Minecraft-Dateien.')
    parser.add_argument('-a', '--animations', action='store_true', help='Erstellt die Animations-Dateien')
    parser.add_argument('-m', '--models', action='store_true', help='Erstellt die Modell-Dateien')
    parser.add_argument('-r', '--recipes', action='store_true', help='Erstellt die Rezept-Dateien')
    parser.add_argument('-rm', '--remove', action='store_true', help='Erstellt die Remove-Dateien')
    parser.add_argument('-s', '--spawn', action='store_true', help='Erstellt die Spawn-Dateien')
    parser.add_argument('-d', '--debug', action='store_true', help='Zeigt Debug-Informationen an')
    parser.add_argument('-c', '--clean', action='store_true', help='Löscht alle generierten Dateien')
    parser.add_argument('-v', '--version', action='version', version='1.0', help='Zeigt die Skript-Version an')

    args = parser.parse_args()

    if args.animations:
        subprocess.run(['python', 'generate_animation_files.py'])
    if args.models:
        subprocess.run(['python', 'generate_model_files.py'])
    if args.recipes:
        subprocess.run(['python', 'generate_recipe_files.py'])
    if args.remove:
        subprocess.run(['python', 'generate_remove_files.py'])
    if args.spawn:
        subprocess.run(['python', 'generate_spawn_files.py'])
    if args.debug:
        debug()
    if args.clean:
        print("Lösche generierte Dateien...")
        subprocess.run(['python', 'clean.py'])

    if any([args.animations, args.models, args.recipes, args.spawn, args.debug, args.clean]):
        print("Fertig!")

if __name__ == "__main__":
    main()
