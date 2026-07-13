from app.controllers.application import Application
from bottle import Bottle, run, static_file
import bottle
import os

bottle.TEMPLATE_PATH.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), 'app', 'views', 'html'))

app = Bottle()
ctl = Application()


@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root='./app/static')


@app.route('/helper')
def helper():
    return ctl.render('helper')


@app.route("/")
def home():
    return ctl.render("home")


@app.route('/espetaculos')
def listar_espetaculos():
    return ctl.render('espetaculos_lista')


@app.route('/espetaculos/novo')
def form_novo():
    return ctl.espetaculos_form()


@app.route('/espetaculos/criar', method='POST')
def criar():
    return ctl.espetaculos_criar()


@app.route('/espetaculos/editar/<id:int>')
def form_editar(id):
    return ctl.espetaculos_form(id)


@app.route('/espetaculos/atualizar/<id:int>', method='POST')
def atualizar(id):
    return ctl.espetaculos_atualizar(id)


@app.route('/espetaculos/deletar/<id:int>')
def deletar(id):
    return ctl.espetaculos_deletar(id)


if __name__ == '__main__':
    run(app, host='0.0.0.0', port=8080, debug=True)