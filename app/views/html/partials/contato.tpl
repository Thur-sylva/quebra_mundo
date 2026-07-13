<section id="espetaculos">
    <div class="espetaculos-titulo">
        <span>NOSSOS TRABALHOS</span>
        <h2>Espetáculos em cena.</h2>
    </div>

    % if espetaculos:
        <div class="espetaculos-grid">
            % for e in espetaculos:
            <div class="espetaculo-item">
                <div class="espetaculo-overlay">
                    <div class="espetaculo-overlay-conteudo">
                        <span>{{e['data']}}</span>
                        <h3>{{e['titulo']}}</h3>
                        <p>{{e['descricao']}}</p>
                    </div>
                </div>
            </div>
            % end
        </div>
    % else:
        <p class="espetaculos-vazio">Em breve, novos espetáculos em cartaz.</p>
    % end
</section>