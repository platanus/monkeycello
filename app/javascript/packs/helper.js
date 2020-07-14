function bananasToInt(bananas) {
  return parseInt(bananas.substr(2), 10);
}
export default function topTenWinners(allMonkeys) {
  const allMonkeysSorted = allMonkeys.sort((a, b) => bananasToInt(b.bananas) - bananasToInt(a.bananas));

  return allMonkeysSorted.slice(0, 10);
}
