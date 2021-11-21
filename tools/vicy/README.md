### Run as CLI

Install necessary dependency (only once)

    ./prepare-cli.sh

Run CLI

    ./vicy.sh

### Transpile for usage in browser

    ./transpile.sh

### Serve via http

    npx live-server .

### Serve via https (allows to install it as PWA)

Use the makefile of certificates/ to create a valid ssl certificate and rootCA
(which should only be temporarily imported into Chrome since after installing vicy
it is available offline and the rootCA is not necessary anymore)
and run the following (also from certificates/)

    ./serve.sh <certName> ../vicy
