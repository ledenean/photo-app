function fadeOut(div){
    var opacity = 1;
    var timer = setInterval(function() {
        opacity -= 25/100;
        if(opacity<=0){
            clearInterval(timer);
            opacity=0;
            div.style.display = "none";
            div.remove();
            length = length-1;
            document.getElementById('items-count').innerHTML = `${length} photo(s) are being shown`;   
        }
        div.style.opacity = opacity;
        div.style.filter = "alpha(opacity" + opacity*100 + ")";
    }, 100);
}
function createPhotoCard(data, containerDiv){
        let div = document.createElement('div');
        let img = document.createElement('img');
        let title = document.createElement('label');
        div.id = data.id;
        div.classList.add('fadeOut');
        img.src = data.url;
        img.width = "200";
        img.height = "200";
        title.textContent = data.title;
        containerDiv.appendChild(div);
        div.appendChild(img);
        div.appendChild(title);
        div.addEventListener('click', (e) => {
            fadeOut(div);
        });
}

let mainDiv = document.getElementById("container");
let length = 0;
if (mainDiv){
    let fetchURL = "https://jsonplaceholder.typicode.com/albums/2/photos";
    fetch(fetchURL)
    .then((data) => data.json())
    .then((photos) => {
        photos.forEach((photo) => {
            createPhotoCard(photo, mainDiv);
        });
        length = photos.length;
        document.getElementById("items-count").innerHTML= `${photos.length} photo(s) are being shown`;   
    }) 
}