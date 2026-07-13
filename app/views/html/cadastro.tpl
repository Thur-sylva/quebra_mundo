<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Quebra Mundo</title>
    <link rel="stylesheet" href="/static/css/navbar.css">
</head>
<body style="background:#090909; color:white; padding:100px 8% 60px;">

    % include('partials/navbar')

    <h2>Criar conta</h2>

    % if erro:
        <p style="color:#ff4444;">Esse nome de usuário já existe. Escolha outro.</p>
    % end

    <form action="/cadastro" method="post" style="display:flex; flex-direction:column; gap:15px; max-width:300px; margin-top:30px;">
        <label>Usuário</label>
        <input type="text" name="username" required style="padding:10px; border-radius:6px; border:none;">

        <label>Senha</label>
        <input type="password" name="password" required style="padding:10px; border-radius:6px; border:none;">

        <button type="submit" style="margin-top:10px; padding:12px; background:#C7FF00; border:none; border-radius:6px; font-weight:600; cursor:pointer;">
            Cadastrar
        </button>
    </form>

    <p style="margin-top:30px;"><a href="/portal" style="color:white;">Já tenho conta — fazer login</a></p>

</body>
</html>