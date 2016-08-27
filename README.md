# Dockerize a Symfony app

This tool helps generating a `docker-compose.yml` file and necessary images to run a symfony app.

**DEPRECATED**: Due to complexity, I've found a simpler solution. [Go to my gist](https://gist.github.com/fabienduhamel/ea827d543dcf418040faf681f0da227b)

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

