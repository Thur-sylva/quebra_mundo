const socket = new WebSocket('ws://' + window.location.host + '/websocket');

socket.onmessage = function(event) {
    if (event.data === 'atualizar') {
        location.reload();
    }
};

socket.onopen = function() {
    console.log('Conectado ao servidor em tempo real');
};