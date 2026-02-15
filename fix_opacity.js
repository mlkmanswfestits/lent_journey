const fs = require('fs');
const path = require('path');

const screensDir = 'lib/screens';

// Read all .dart files in the screens directory
const files = fs.readdirSync(screensDir).filter(f => f.endsWith('.dart'));

files.forEach(file => {
    const filePath = path.join(screensDir, file);
    let content = fs.readFileSync(filePath, 'utf8');

    // Replace .withOpacity( with .withValues(alpha: 
    const newContent = content.replace(/\.withOpacity\(/g, '.withValues(alpha: ');

    if (content !== newContent) {
        fs.writeFileSync(filePath, newContent, 'utf8');
        console.log(`Fixed: ${file}`);
    }
});

console.log('Done!');
