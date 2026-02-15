import os
import re

# Directory containing the Dart files
screens_dir = r'C:\Users\chann\.gemini\antigravity\scratch\lent-journey\mobile-apps\catholic_app\lib\screens'

# Pattern to match .withOpacity(
pattern = r'\.withOpacity\('
replacement = r'.withValues(alpha: '

# Process all .dart files in the screens directory
for filename in os.listdir(screens_dir):
    if filename.endswith('.dart'):
        filepath = os.path.join(screens_dir, filename)
        
        # Read the file
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Replace all occurrences
        new_content = re.sub(pattern, replacement, content)
        
        # Write back if changes were made
        if new_content != content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f'Fixed: {filename}')

print('Done!')
