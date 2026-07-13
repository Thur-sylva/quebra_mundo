from app.models.user_account import UserAccount
import json
import uuid


class AuthRecord():
    """Gerencia autenticação de usuários (login/logout)"""

    def __init__(self):
        self.__user_accounts = []
        self.__authenticated_users = {}
        self.read()

    def read(self):
        try:
            with open("app/controllers/db/user_accounts.json", "r") as arquivo_json:
                user_data = json.load(arquivo_json)
                self.__user_accounts = [UserAccount(**data) for data in user_data]
        except FileNotFoundError:
            self.__user_accounts.append(UserAccount('admin', '123456'))

    def check_user(self, username, password):
        for user in self.__user_accounts:
            if user.username == username and user.password == password:
                session_id = str(uuid.uuid4())
                self.__authenticated_users[session_id] = user
                return session_id
        return None

    def get_username(self, session_id):
        if session_id in self.__authenticated_users:
            return self.__authenticated_users[session_id].username
        return None

    def logout(self, session_id):
        if session_id in self.__authenticated_users:
            del self.__authenticated_users[session_id]

    def is_logged_in(self, session_id):
        return session_id in self.__authenticated_users
    
    def register(self, username, password):
    
        for user in self.__user_accounts:
            if user.username == username:
                return False  # já existe

        novo_usuario = UserAccount(username, password)
        self.__user_accounts.append(novo_usuario)

        with open("app/controllers/db/user_accounts.json", "w") as arquivo_json:
            user_data = [vars(u) for u in self.__user_accounts]
            json.dump(user_data, arquivo_json)

        return True