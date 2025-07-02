(async function () {
  try {
    const response = await fetch(
      'https://www.worldspaceflight.com/bios/currentlyinspace.php'
    );
    if (!response.ok) throw new Error('Network response was not ok');
    const html = await response.text();
    const match = html
      .replace(/\n/g, '')
      .match(/There are currently (\d+) people in space/);
    if (!match) throw new Error('Could not parse astronaut count');
    document.getElementById('count').textContent = match[1];
  } catch (err) {
    console.error('Failed to fetch astronaut count', err);
    document.getElementById('count').textContent = '?';
  }
})();
