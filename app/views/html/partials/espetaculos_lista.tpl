<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Espetáculos cadastrados - Quebra Mundo</title>

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/navbar.css">
</head>
<body style="background:#090909; color:white; padding: 100px 8% 60px;">

    % include('partials/navbar')

    <h2>Espetáculos cadastrados</h2>

    <div style="display:flex; justify-content:space-between; align-items:center; margin-top:10px;">
        % if logado:
            <a href="/espetaculos/novo" style="color:#C7FF00;">+ Novo espetáculo</a>
            <form action="/logout" method="post" style="display:inline;">
                <button type="submit" style="background:none; border:none; color:#ff4444; cursor:pointer; font-size:16px;">Sair</button>
            </form>
        % else:
            <a href="/portal" style="color:#C7FF00;">Entrar para gerenciar</a>
        % end
    </div>

    <table style="width:100%; margin-top:30px; border-collapse: collapse;">
        <tr style="text-align:left; border-bottom:1px solid #444;">
            <th style="padding:10px;">Título</th>
            <th style="padding:10px;">Descrição</th>
            <th style="padding:10px;">Data</th>
            <th style="padding:10px;">Ações</th>
        </tr>
        % if espetaculos:
            % for e in espetaculos:
            <tr style="border-bottom:1px solid #222;">
                <td style="padding:10px;">{{e['titulo']}}</td>
                <td style="padding:10px;">{{e['descricao']}}</td>
                <td style="padding:10px;">{{e['data']}}</td>
                <td style="padding:10px;">
                    % if logado:
                        <a href="/espetaculos/editar/{{e['id']}}" style="color:#C7FF00; margin-right:15px;">Editar</a>
                        <a href="/espetaculos/deletar/{{e['id']}}" style="color:#ff4444;">Excluir</a>
                    % else:
                        —
                    % end
                </td>
            </tr>
            % end
        % else:
            <tr><td colspan="4" style="padding:10px;">Nenhum espetáculo cadastrado ainda.</td></tr>
        % end
    </table>

    <p style="margin-top:40px;"><a href="/" style="color:white;">← Voltar para a home</a></p>

</body>
</html>