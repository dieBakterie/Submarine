from minecraft_utils import (
    setup_logging,
    log_message,
    os,
    shutil
)

setup_logging('zip_logs', 'generate_zip_files.log')

# Path to the base 'Minecraft Packs' folder (from the 'tools' directory)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
minecraft_packs_dir = os.path.join(BASE_DIR, 'Minecraft Packs')

# Function to zip the contents of the resource pack and datapack folders
def zip_packs_for_version(version_folder):
    version_path = os.path.join(minecraft_packs_dir, version_folder)
    log_message(f"Zipping: {version_folder}")

    if os.path.isdir(version_path):
        for pack_folder in os.listdir(version_path):
            pack_path = os.path.join(version_path, pack_folder)
            log_message(f"Zipping: {pack_folder}")

            if os.path.isdir(pack_path):
                # Loop through each pack folder
                for content_folder in os.listdir(pack_path):
                    content_path = os.path.join(pack_path, content_folder)
                    log_message(f"Zipping: {content_folder}")

                    if os.path.isdir(content_path):
                        # Zip the contents of the content folder
                        zip_file_name = f"{content_folder} {version_folder}.zip"
                        zip_file_path = os.path.join(version_path, zip_file_name)

                        shutil.make_archive(zip_file_path.replace('.zip', ''), 'zip', content_path)
                        log_message(f"Zipped: {zip_file_name}")

# Loop through the version folders
def zip_all_versions():
    for version_folder in os.listdir(minecraft_packs_dir):
        version_path = os.path.join(minecraft_packs_dir, version_folder)

        if os.path.isdir(version_path):
            zip_packs_for_version(version_folder)

# Run the zipping process for all versions
zip_all_versions()
