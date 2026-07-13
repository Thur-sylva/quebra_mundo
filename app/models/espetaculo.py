import sqlite3

class Espetaculo:
    def __init__(self, id=None, titulo='', descricao='', data=''):
        self.id = id
        self.titulo = titulo
        self.descricao = descricao
        self.data = data

    @staticmethod
    def conectar():
        conn = sqlite3.connect('app/controllers/db/database.db')
        conn.row_factory = sqlite3.Row
        return conn

    @staticmethod
    def criar_tabela():
        conn = Espetaculo.conectar()
        conn.execute('''
            CREATE TABLE IF NOT EXISTS espetaculos (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                titulo TEXT NOT NULL,
                descricao TEXT,
                data TEXT
            )
        ''')
        conn.commit()
        conn.close()

    @staticmethod
    def listar_todos():
        conn = Espetaculo.conectar()
        rows = conn.execute('SELECT * FROM espetaculos').fetchall()
        conn.close()
        return rows

    @staticmethod
    def buscar_por_id(id):
        conn = Espetaculo.conectar()
        row = conn.execute('SELECT * FROM espetaculos WHERE id = ?', (id,)).fetchone()
        conn.close()
        return row

    @staticmethod
    def salvar(titulo, descricao, data):
        conn = Espetaculo.conectar()
        conn.execute('INSERT INTO espetaculos (titulo, descricao, data) VALUES (?, ?, ?)',
                     (titulo, descricao, data))
        conn.commit()
        conn.close()

    @staticmethod
    def atualizar(id, titulo, descricao, data):
        conn = Espetaculo.conectar()
        conn.execute('UPDATE espetaculos SET titulo=?, descricao=?, data=? WHERE id=?',
                     (titulo, descricao, data, id))
        conn.commit()
        conn.close()

    @staticmethod
    def deletar(id):
        conn = Espetaculo.conectar()
        conn.execute('DELETE FROM espetaculos WHERE id = ?', (id,))
        conn.commit()
        conn.close()