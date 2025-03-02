#set page(flipped: true, margin: 1cm);

#let large = (
  height: 9.52cm,
  width: 6.98cm,
)
#let small = (
  height: 9.52cm,
  width: 6.78cm,
)
#let size = small
#let investigator-size = (
  height: 7cm,
  width: 4.78cm,
)

#let file-names = read("images.txt", encoding: "utf8").split("\n").filter(s => s != "")
#let paths = file-names.map(s => "images/" + s);
#let images = paths.map(path => scale(99.7899%, reflow: true)[#image(
    path,
    height: size.height,
    width: size.width,
    scaling: "smooth",
    fit: "stretch",
  )]);

#let file-names-rotated = read("images_rotated.txt", encoding: "utf8").split("\n").filter(s => s != "");
#let paths-rotated = file-names-rotated.map(s => "rotated/" + s);
#for i in range(0, paths-rotated.len()) {
  let img = scale(99.7899%, reflow: true)[#image(
      paths-rotated.at(i),
      height: size.height,
      width: size.width,
      scaling: "smooth",
      fit: "stretch",
    )]
  if (calc.odd(i)) {
    img = rotate(180deg, img)
  }
  images.push(img)
}

#let file-names-investigators = read("images_investigators.txt", encoding: "utf8").split("\n").filter(s => s != "");
#let paths-investigators = file-names-investigators.map(s => "investigators/" + s);
#for i in range(0, paths-investigators.len()) {
  let img = image(
    paths-investigators.at(i),
    height: investigator-size.height,
    width: investigator-size.width,
    scaling: "smooth",
    fit: "stretch",
  )
  images.push(img)
}


#let front-images = ();
#let back-images = ();

#for i in range(0, images.len(), step: 2) {
  front-images.push(images.at(i))
  back-images.push(images.at(i + 1))
}

#let card-count = calc.floor(images.len() / 2);

#for i in range(0, card-count, step: 8) {
  let start = i
  let end = calc.min(i + 8, card-count)

  set text(dir: direction.ltr)
  grid(
    columns: 4,
    ..front-images.slice(start, end),
  )
  set text(dir: direction.rtl)
  grid(
    columns: 4,
    ..back-images.slice(start, end),
  )
}
