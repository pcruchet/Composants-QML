function obtenirJour(laDate)
{
    const dateTexte = new String(laDate.toLocaleDateString(Qt.locale("fr_FR"),Locale.ShortFormat));
    const decoupe = dateTexte.split('/');
    return decoupe[0];
}

function obtenirNumMois(laDate)
{
    const dateTexte = new String(laDate.toLocaleDateString(Qt.locale("fr_FR"),Locale.ShortFormat));
    const decoupe = dateTexte.split('/');
    return decoupe[1];
}

function obtenirAnnee(laDate)
{
    const dateTexte = new String(laDate.toLocaleDateString(Qt.locale("fr_FR"),Locale.ShortFormat));
    const decoupe = dateTexte.split('/');
    return decoupe[2];
}


function obtenirMois(titre)
{
    const decoupe = titre.split(' ');
    return decoupe[0];
}


