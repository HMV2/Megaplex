var like_btn = document.querySelectorAll('.btn-thumb')
    var like_count = document.querySelectorAll('.like-count')
    //  unique id is set for all the like
    for (var i = 0; i < like_count.length; i++) {
           like_count[i].id = `like-count${i}`


    }
    console.log(like_btn)
    // for each like button a ajax call is made
    like_btn.forEach((item, index, arr) => {

        arr[index].addEventListener('click', (e) => {
            item.classList.toggle('text-primary')
            e.preventDefault();



            var commentID = arr[index].getAttribute('data-new')
            $.ajax({
                type: "POST",
                url: "/product/" + commentID + "/comment_like",
                enctype: 'multipart/form-data',
                data: {
                    csrfmiddlewaretoken: $('input[name=csrfmiddlewaretoken]').val()
                },

                success: function (data) {
                    if (data.is_like) {
                        var liked = document.getElementById(`like-count${index}`)

                        liked.innerHTML = data.like_count
                    } else {
                        var liked = document.getElementById(`like-count${index}`)
                        liked.innerHTML = data.like_count
                    }
                }
            })
        })
    }) 