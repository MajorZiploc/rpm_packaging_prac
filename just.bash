export JUST_PROJECT_ROOT="`pwd`";

function just_container_run {
  docker-compose -f "$JUST_PROJECT_ROOT/compose.yml" -f "$JUST_PROJECT_ROOT/compose-dev.yml" up -d --force-recreate;
}

function just_container_stop {
  docker-compose -f "$JUST_PROJECT_ROOT/compose.yml" -f "$JUST_PROJECT_ROOT/compose-dev.yml" down -v;
}

function just_container_connect {
  docker exec -i -t rpm_packaging_prac_app bash;
}
