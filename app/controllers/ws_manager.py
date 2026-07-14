class WSManager:
    def __init__(self):
        self.clientes = []

    def conectar(self, ws):
        self.clientes.append(ws)

    def desconectar(self, ws):
        if ws in self.clientes:
            self.clientes.remove(ws)

    def transmitir(self, mensagem):
        for cliente in list(self.clientes):
            try:
                cliente.send(mensagem)
            except Exception:
                self.desconectar(cliente)