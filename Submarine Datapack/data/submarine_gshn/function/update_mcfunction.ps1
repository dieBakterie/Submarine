# Define the mapping of colors to their custom_model_data starting points
$colorModelDataMapping = @{
    "black" = 1;
    "blue" = 5;
    "brown" = 9;
    "cyan" = 13;
    "gray" = 17;
    "green" = 21;
    "light_blue" = 25;
    "light_gray" = 29;
    "lime" = 33;
    "magenta" = 37;
    "orange" = 41;
    "pink" = 45;
    "purple" = 49;
    "red" = 53;
    "white" = 57;
    "yellow" = 61;
}

# Get all .mcfunction files in the current directory
$files = Get-ChildItem -Path . -Filter "*.mcfunction"

foreach ($file in $files) {
    # Determine the color from the filename
    $fileName = $file.Name
    $color = $fileName -replace "submarine_(\w+)_animation(\.mcfunction)", '$1'
    
    # Check if the color is valid
    if ($colorModelDataMapping.ContainsKey($color)) {
        $startModelData = $colorModelDataMapping[$color]

        # Read the contents of the file
        $content = Get-Content $file.FullName

        # Update the custom_model_data values in the file content
        $newContent = $content -replace 'custom_model_data:\d+', {
            param($matches, $i)
            "custom_model_data:" + ($startModelData + ($i % 4))
        }

        # Save the updated content back to the file
        Set-Content -Path $file.FullName -Value $newContent
    }
}

Write-Host "All mcfunction files have been successfully updated."
