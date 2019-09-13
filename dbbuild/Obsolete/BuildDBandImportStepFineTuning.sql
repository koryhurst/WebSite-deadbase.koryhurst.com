update tblshow 
set mynotes = "Jerry Garcia played a verse of this with the Grateful Dead on 18 April 1986, before switching to That's All Right Mama. There is no record of him playing it with any of his solo bands."
where showid = 1869;

Update tblsong
set MainVocals = 'Phil'
where SongText = 'Tom Thumb Blues';