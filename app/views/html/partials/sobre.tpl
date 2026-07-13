<section id="sobre">
    <div class="sobre-texto">
        <span>QUEM SOMOS</span>
        <h2>O teatro como ferramenta de transformação.</h2>
        <p>
            O Coletivo Quebra Mundo desenvolve espetáculos,
            intervenções e ações culturais que aproximam
            a arte do território e das pessoas.
        </p>
    </div>

    % membros = [
    %   {'nome': 'Integrante 1', 'foto': '/static/img/equipe/sabrina1.jpg'},
    %   {'nome': 'Integrante 2', 'foto': '/static/img/equipe/sabrina2.jpg'},
    %   {'nome': 'Integrante 3', 'foto': '/static/img/equipe/sabrina3.jpg'},
    % ]

    <div class="equipe-carrossel">
        <button class="btn-slide seta-esquerda" id="prevBtn">‹</button>

        <div class="equipe-viewport">
            <div class="equipe-track" id="equipeTrack">
                % for m in membros:
                <div class="equipe-card">
                    <div class="equipe-moldura">
                        <img src="{{m['foto']}}" alt="{{m['nome']}}">
                    </div>
                    <h3>{{m['nome']}}</h3>
                </div>
                % end
            </div>
        </div>

        <button class="btn-slide seta-direita" id="nextBtn">›</button>
    </div>
</section>