let module = document.querySelectorAll('.module')
let readMore = document.querySelectorAll('.btn-read')

for(let i = 0; i < module.length; i++){
    readMore[i].addEventListener('click',()=>{
        let x = module[i].className.match('show')
        

        if(x){
            readMore[i].innerHTML =`READ MORE <i class="fas fa-chevron-down"></i>`
            module[i].classList.toggle("show");
           

        }
        else{
            readMore[i].innerHTML = `SHOW LESS <i class="fas fa-chevron-up"></i>`;
            module[i].classList.toggle("show");

        }
    })
}