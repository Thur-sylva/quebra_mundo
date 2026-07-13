<h2>Espetáculos cadastrados</h2>
<a href="/espetaculos/novo">+ Novo espetáculo</a>
<table>
  % for e in espetaculos:
  <tr>
    <td>{{e['titulo']}}</td>
    <td>{{e['data']}}</td>
    <td>
      <a href="/espetaculos/editar/{{e['id']}}">Editar</a>
      <a href="/espetaculos/deletar/{{e['id']}}">Excluir</a>
    </td>
  </tr>
  % end
</table>

