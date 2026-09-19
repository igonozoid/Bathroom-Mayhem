const runner=document.querySelector('#runner'),speed=document.querySelector('#speed'),fps=document.querySelector('#fps'),note=document.querySelector('#note'),stage=document.querySelector('.stage'),pause=document.querySelector('#pause');
const notes={run:'Corrida: validar alternância de pernas e balanço de braços.', 'jump-short':'Pulo curto: saída rápida e altura legível.', 'jump-long':'Pulo longo: arco maior, corpo estendido.',slide:'Slide: silhueta baixa e leitura imediata.'};
document.querySelectorAll('[data-state]').forEach(button=>button.addEventListener('click',()=>{document.querySelectorAll('[data-state]').forEach(item=>item.classList.remove('active'));button.classList.add('active');runner.className.baseVal='';if(button.dataset.state==='run')runner.classList.add('running');else runner.classList.add(button.dataset.state);note.textContent=notes[button.dataset.state]}));
speed.addEventListener('input',()=>{const value=speed.value;fps.textContent=`${value} fps`;document.documentElement.style.setProperty('--frame',`${8/value}s`)});
document.querySelector('#guides').addEventListener('change',event=>stage.classList.toggle('no-guides',!event.target.checked));
pause.addEventListener('click',()=>{runner.classList.toggle('paused');pause.textContent=runner.classList.contains('paused')?'Continuar':'Pausar'});
runner.classList.add('running');
