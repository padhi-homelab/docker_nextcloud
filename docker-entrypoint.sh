#!/bin/sh

export ENTRYPOINT_D="${ENTRYPOINT_D:-/docker-entrypoint.d}"

if find "$ENTRYPOINT_D" -mindepth 1 -maxdepth 1 -print -quit 2>/dev/null | read v; then
    echo "$ENTRYPOINT_D is not empty, attempting pre-configuration."

    echo "Looking for shell scripts in $ENTRYPOINT_D ..."
    find "$ENTRYPOINT_D" -follow -type f -print | sort -n | while read -r f; do
        case "$f" in
            *.sh)
                if [ -x "$f" ]; then
                    echo "  + Launching $f ...";
                    "$f"
                else
                    echo "  + Ignoring $f: not executable!";
                fi
                ;;
            *)
                echo "  + Ignoring $f: not a '.sh' script."
                ;;
        esac
    done

    echo "Pre-configuration complete."
else
    echo "No files found in $ENTRYPOINT_D, skipping pre-configuration."
fi

echo "Launching real entrypoint."
exec /entrypoint.sh "$@"
