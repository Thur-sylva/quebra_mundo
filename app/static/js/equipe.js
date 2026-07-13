const track = document.getElementById('equipeTrack');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');

if (track && prevBtn && nextBtn) {
    const cardWidth = 200 + 40;
    const visiveis = 3;
    let posicaoAtual = 0;

    function atualizarCarrossel() {
        const totalCards = track.children.length;
        const maxPosicao = Math.max(0, totalCards - visiveis);

        if (posicaoAtual < 0) posicaoAtual = 0;
        if (posicaoAtual > maxPosicao) posicaoAtual = maxPosicao;

        track.style.transform = `translateX(-${posicaoAtual * cardWidth}px)`;
    }

    nextBtn.addEventListener('click', () => {
        posicaoAtual++;
        atualizarCarrossel();
    });

    prevBtn.addEventListener('click', () => {
        posicaoAtual--;
        atualizarCarrossel();
    });
}