
    var product_like_btn = document.querySelectorAll('.product-like-btn')
   
  
    // for each like button a ajax call is made
    product_like_btn.forEach((item, index, arr) => {
        
        arr[index].addEventListener('click', (e) => {
           
            item.classList.toggle('text-danger')
            e.preventDefault();

            

            var productId = arr[index].getAttribute('data-new')
            $.ajax({
                type: "POST",
                url: "/product/" + productId + "/like",
                enctype: 'multipart/form-data',
                data: {
                    csrfmiddlewaretoken: $('input[name=csrfmiddlewaretoken]').val()
                },

                success: function (data) {
                    let badge = document.getElementById(`like-badge`)
                   
                    if (data.is_like) {
                         

                        badge.innerHTML = data.like_count 

                    } else {
                        
                        
                        badge.innerHTML = data.like_count 

                    }
                }
      
               
            })

        })
    })