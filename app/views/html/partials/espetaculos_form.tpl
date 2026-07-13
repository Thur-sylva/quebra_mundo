<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ 'Editar' if espetaculo else 'Novo' }} espetáculo - Quebra Mundo</title>

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/navbar.css">
</head>
<body style="background:#090909; color:white; padding: 100px 8% 60px;">

    % include('partials/navbar')

    <h2>{{ 'Editar' if espetaculo else 'Novo' }} espetáculo</h2>

    <form method="POST"
          action="{{ '/espetaculos/atualizar/' + str(espetaculo['id']) if espetaculo else '/espetaculos/criar' }}"
          style="display:flex; flex-direction:column; gap:15px; max-width:400px; margin-top:30px;">

        <label>Título</label>
        <input type="text" name="titulo" required
               value="{{espetaculo['titulo'] if espetaculo else ''}}"
               style="padding:10px; border-radius:6px; border:none;">

        <label>Descrição</label>
        <textarea name="descricao" rows="4"
                  style="padding:10px; border-radius:6px; border:none;">{{espetaculo['descricao'] if espetaculo else ''}}</textarea>

        <label>Data</label>
        <input type="text" name="data" placeholder="ex: 20/08/2026"
               value="{{espetaculo['data'] if espetaculo else ''}}"
               style="padding:10px; border-radius:6px; border:none;">

        <button type="submit" style="margin-top:10px; padding:12px; background:#C7FF00; border:none; border-radius:6px; font-weight:600; cursor:pointer;">
            Salvar
        </button>
    </form>

    <p style="margin-top:30px;"><a href="/espetaculos" style="color:white;">← Voltar para a lista</a></p>

</body>
</html>