const searchInput = document.getElementById("search-input");
const searchButton = document.getElementById("search-button");
const pokemonName = document.getElementById("pokemon-name");
const pokemonId = document.getElementById("pokemon-id");
const weight = document.getElementById("weight");
const height = document.getElementById("height");
const spriteContainer = document.getElementById("sprite-container");
const types = document.getElementById("types");
const hp = document.getElementById("hp");
const attack = document.getElementById("attack");
const defense = document.getElementById("defense");
const specialAttack = document.getElementById("special-attack");
const specialDefense = document.getElementById("special-defense");
const speed = document.getElementById("speed");

const fetchPokemon = async (nameOrId) => {
    const lowerCaseNameOrId = nameOrId.toLowerCase();
    const res = await fetch(`https://pokeapi-proxy.freecodecamp.rocks/api/pokemon/${lowerCaseNameOrId}`);
    const data = await res.json();
    return data;
};

const displayPokemonData = (pokemonData) => {
    pokemonName.textContent = pokemonData.name;
    pokemonId.textContent = pokemonData.id;
    weight.textContent = pokemonData.weight;
    height.textContent = pokemonData.height;
    hp.textContent = pokemonData.stats[0].base_stat;
    attack.textContent = pokemonData.stats[1].base_stat;
    defense.textContent = pokemonData.stats[2].base_stat;
    specialAttack.textContent = pokemonData.stats[3].base_stat;
    specialDefense.textContent = pokemonData.stats[4].base_stat;
    speed.textContent = pokemonData.stats[5].base_stat;
    spriteContainer.innerHTML = `<img src=${pokemonData.sprites.front_default} alt=${pokemonData.name} class="sprite" id="sprite">`;
    types.innerHTML = pokemonData.types.map(type => `<span class="type">${type.type.name.toUpperCase()}</span>`).join("");
};

const checkInput = async () => {
    types.textContent = "";
    if (searchInput.value.includes("Red")) {
        alert("Pokémon not found");
    } else {
        try {
            const pokemonData = await fetchPokemon(searchInput.value);
            displayPokemonData(pokemonData);
        } catch (err) {
            alert("Pokémon not found");
        }
    }
};

searchButton.addEventListener("click", checkInput);
