let showPassword = document.querySelectorAll('.eyeIcon')
let password = document.querySelectorAll('.password')

function toggleHidden(){
    let inputElement = this.parentElement.children[1]

    if(inputElement.type === "password"){
        inputElement.type = "text"
        this.classList.toggle('fa-eye-slash')
        this.classList.toggle('fa-eye')
    }
    else{
        inputElement.type = "password"
        this.classList.toggle('fa-eye-slash')
        this.classList.toggle('fa-eye')
    }
}


showPassword.forEach((item) => {

    item.addEventListener('click', toggleHidden)
});