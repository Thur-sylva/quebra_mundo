<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Quebra Mundo</title>
    <link rel="stylesheet" href="/static/css/navbar.css">
</head>
<body style="background:#090909; color:white; padding:100px 8% 60px;">

    % include('partials/navbar')

    <h2>Login</h2>

    % if erro:
        <p style="color:#ff4444;">Usuário ou senha inválidos.</p>
    % end

    <form action="/portal" method="post" style="display:flex; flex-direction:column; gap:15px; max-width:300px; margin-top:30px;">
        <label>Usuário</label>
        <input type="text" name="username" required style="padding:10px; border-radius:6px; border:none;">

        <label>Senha</label>
        <input type="password" name="password" required style="padding:10px; border-radius:6px; border:none;">

        <button type="submit" style="margin-top:10px; padding:12px; background:#C7FF00; border:none; border-radius:6px; font-weight:600; cursor:pointer;">
            Entrar
        </button>
    </form>

    <p style="margin-top:30px;"><a href="/" style="color:white;">← Voltar para a home</a></p>
    <p style="margin-top:15px;"><a href="/cadastro" style="color:#C7FF00;">Ainda não tenho conta — cadastrar</a></p>

</body>
</html>