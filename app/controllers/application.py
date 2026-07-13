from bottle import template, redirect, request, response
from app.controllers.espetaculo_record import EspetaculoRecord
from app.controllers.auth_record import AuthRecord


class Application():

    def __init__(self):
        self.pages = {
            'home': self.home,
            'helper': self.helper,
            'espetaculos_lista': self.espetaculos_lista,
            'espetaculos_form': self.espetaculos_form,
            'portal': self.portal,
        }
        self.__model = EspetaculoRecord()
        self.__auth = AuthRecord()

    def render(self, page, parameter=None):
        content = self.pages.get(page, self.helper)
        if not parameter:
            return content()
        else:
            return content(parameter)

    def get_session_id(self):
        return request.get_cookie('session_id')

    def is_authenticated(self):
        session_id = self.get_session_id()
        return self.__auth.is_logged_in(session_id)

    def home(self):
        espetaculos = self.__model.listar_todos()
        return template("home", espetaculos=espetaculos)

    def helper(self):
        return template("helper")

    def portal(self, erro=False):
        return template('portal', erro=erro)

    def authenticate_user(self, username, password):
        session_id = self.__auth.check_user(username, password)
        return session_id

    def logout_user(self):
        session_id = self.get_session_id()
        if session_id:
            self.__auth.logout(session_id)

    # ---- CRUD de Espetáculos (protegido) ----

    def espetaculos_lista(self):
        lista = self.__model.listar_todos()
        return template('partials/espetaculos_lista', espetaculos=lista, logado=self.is_authenticated())

    def espetaculos_form(self, id=None):
        if not self.is_authenticated():
            redirect('/portal')
        espetaculo = self.__model.buscar_por_id(id) if id else None
        return template('partials/espetaculos_form', espetaculo=espetaculo)

    def espetaculos_criar(self):
        if not self.is_authenticated():
            redirect('/portal')
        titulo = request.forms.get('titulo')
        descricao = request.forms.get('descricao')
        data = request.forms.get('data')
        self.__model.salvar(titulo, descricao, data)
        redirect('/espetaculos')

    def espetaculos_atualizar(self, id):
        if not self.is_authenticated():
            redirect('/portal')
        titulo = request.forms.get('titulo')
        descricao = request.forms.get('descricao')
        data = request.forms.get('data')
        self.__model.atualizar(id, titulo, descricao, data)
        redirect('/espetaculos')

    def espetaculos_deletar(self, id):
        if not self.is_authenticated():
            redirect('/portal')
        self.__model.deletar(id)
        redirect('/espetaculos')