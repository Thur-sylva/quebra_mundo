<section id="espetaculos">
    <div class="espetaculos-titulo">
        <span>NOSSOS TRABALHOS</span>
        <h2>Espetáculos em cena.</h2>
    </div>

    % if espetaculos:
        <div class="espetaculos-grid">
            % for e in espetaculos:
            <div class="espetaculo-card">
                <div class="espetaculo-capa"></div>
                <div class="espetaculo-info">
                    <h3>{{e['titulo']}}</h3>
                    <span class="espetaculo-data">{{e['data']}}</span>
                    <p>{{e['descricao']}}</p>
                </div>
            </div>
            % end
        </div>
    % else:
        <p class="espetaculos-vazio">Em breve, novos espetáculos em cartaz.</p>
    % end
</section>