# Dockerize a Symfony app

This tool helps generating a `docker-compose.yml` file and necessary images to run a symfony app.

## How to

1. Run:
   ```sh
   cp parameters.sh.dist parameters.sh
   ```

2. Edit `parameters.sh` and fill your values.

3. Run:
   ```sh
   ./build.sh
   docker-compose up
   ```

## More

See `bin/dist/` files for further information.

