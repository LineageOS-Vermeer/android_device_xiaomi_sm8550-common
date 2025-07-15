#!/bin/bash

REPO_ROOT="$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../..")"
KERNEL_PLATFORM_DIR="$REPO_ROOT/kernel_platform"
export TARGET_BOARD_PLATFORM=kalama

declare -A SYMLINKS=(
    ["$KERNEL_PLATFORM_DIR/vendor"]="$REPO_ROOT/vendor"
    ["$KERNEL_PLATFORM_DIR/prebuilts/clang"]="$REPO_ROOT/prebuilts/clang"
    ["$KERNEL_PLATFORM_DIR/prebuilts/gcc"]="$REPO_ROOT/prebuilts/gcc"
)

echo "Checking and creating symlinks for kernel_platform..."

all_ok=true

for link_path in "${!SYMLINKS[@]}"; do
    target_path="${SYMLINKS[$link_path]}"

    if [ -L "$link_path" ] && [ "$(realpath "$link_path")" == "$target_path" ]; then
        echo "$link_path already points to $target_path"
    else
        echo "Creating symlink: $link_path -> $target_path"
        mkdir -p "$(dirname "$link_path")"
        ln -sfn "$target_path" "$link_path"
        all_ok=false
    fi
done

