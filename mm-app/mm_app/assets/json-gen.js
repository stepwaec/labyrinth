
let tile_number = 50;
let player_names = ["Paul", "Stephan", "Bob"];
let player_number = player_names.length;

tileOutput = (id, type, angle) => {return `\t{\n\t \
    "id": "${id}",\n\t \
    "type": "${type}",\n\t \
    "angle": ${angle}\n\t \
},\n`};

playerOutput = (id, name) => {return `\t{\n\t \
    "id": "${id}",\n\t \
    "name": "${name}"\n\t \
},\n`};

randomise_id = () => {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
      });
}

randomise_type = () => {
    tmp = Math.floor(Math.random() * 3);
    switch(tmp) {
        case 0: return 'line';
        case 1: return 'corner';
        case 2: return 'tee';
    }
}

randomise_angle = () => {
    tmp = Math.floor(Math.random() * 4);
    switch(tmp) {
        case 0: return 0;
        case 1: return 90;
        case 2: return 180
        case 3: return 270;
    }
}
output = `{\n"session_id": "${randomise_id()}",\n`;

// Player generation
output += `"players": [\n`;
for(let i = 0; i<player_number; i++) {
    output += playerOutput(randomise_id(), player_names[i]);
}
output = output.slice(0,-2) + '\n],\n';   // Final ',' to be removed manually afterwards

// Tile generation
output += `"tiles": [\n`;
for(let i = 0; i<tile_number; i++) {
    output += tileOutput(randomise_id(), randomise_type(), randomise_angle());
}
output = output.slice(0,-2) + '\n]}';   // Final ',' to be removed manually afterwards

console.log(output);