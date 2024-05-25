function addCart(item){
    console.log("test");
    test(item,"Y","cart");
}

function addJjim(item){
    console.log("test");
    test(item,"N","jjim");
}

function test(idx,status,link){
    $.ajax({
        url:"/mypage/addcartone.dox",
        dataType:"json",
        type : "POST",
        data : {
            lecture_idx:idx,
            cart_status:status
        },
        success : function(data) {
            if(data.result == "success") {
                alert(data.msg);
                location.href="/mypage/"+link;
            }else if(data.result =="false"){
                alert(data.msg);
            }else{
                alert(data.msg);
            }
        },
        fail : function (data){

        }

    });
}