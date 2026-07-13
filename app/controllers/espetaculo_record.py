import sqlite3
from app.models.espetaculo import Espetaculo


class EspetaculoRecord():
    """Banco de dados SQLite para o recurso Espetáculos"""

    def __init__(self):
        self.criar_tabela()

    def conectar(self):
        conn = sqlite3.connect('app/controllers/db/database.db')
        conn.row_factory = sqlite3.Row
        return conn

    def criar_tabela(self):
        conn = self.conectar()
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

    def listar_todos(self):
        conn = self.conectar()
        rows = conn.execute('SELECT * FROM espetaculos').fetchall()
        conn.close()
        return rows

    def buscar_por_id(self, id):
        conn = self.conectar()
        row = conn.execute('SELECT * FROM espetaculos WHERE id = ?', (id,)).fetchone()
        conn.close()
        return row

    def salvar(self, titulo, descricao, data):
        conn = self.conectar()
        conn.execute('INSERT INTO espetaculos (titulo, descricao, data) VALUES (?, ?, ?)',
                     (titulo, descricao, data))
        conn.commit()
        conn.close()

    def atualizar(self, id, titulo, descricao, data):
        conn = self.conectar()
        conn.execute('UPDATE espetaculos SET titulo=?, descricao=?, data=? WHERE id=?',
                     (titulo, descricao, data, id))
        conn.commit()
        conn.close()

    def deletar(self, id):
        conn = self.conectar()
        conn.execute('DELETE FROM espetaculos WHERE id = ?', (id,))
        conn.commit()
        conn.close()