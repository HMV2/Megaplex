let edit_btn = document.querySelectorAll('.edit-btn')
let edit_modal = document.querySelectorAll('.edit-modal')
let category_id = document.getElementById('category_id')
let category_name = document.getElementById('category_name')
let category_image = document.getElementById('category_image')
let category_bg_img = document.getElementById('category_bg_img')




edit_btn.forEach((item)=>{
    item.addEventListener('click',()=>{

        let item_id = item.getAttribute('data-id')
        let item_name = item.getAttribute('data-name')
        let item_image = item.getAttribute('data-image')

        console.log(item_image)

        category_id.setAttribute('value',Number(item_id))
        category_name.setAttribute('value',item_name)
        category_image.setAttribute('value',item_image)
        category_bg_img.setAttribute('src',item_image)
       

        



    })
})