# Please read README about this script if you dont understand what is the purpose of this bash script
# Script #3 in README 

#!/bin/bash

# Prompt for the directory location
read -rp "Enter the directory location (e.g., /path/to/folder or . for current): " DIR_PATH

# Resolve and expand the path (handles ~ and relative paths)
DIR_PATH=$(eval echo "$DIR_PATH")

if [ ! -d "$DIR_PATH" ]; then
    echo "Error: Directory '$DIR_PATH' does not exist."
    exit 1
fi

# Prompt for language choice
echo -e "\nSelect Language:"
echo "1) Java"
echo "2) C"
echo "3) C++"
echo "4) Python"
read -rp "Enter choice (1-4): " LANG_CHOICE

# Prompt for the file name
read -rp "Enter the file name (e.g., Main.java or script.py): " FILE_NAME

FULL_PATH="$DIR_PATH/$FILE_NAME"

if [ ! -f "$FULL_PATH" ]; then
    echo "Error: File '$FULL_PATH' not found."
    exit 1
fi

cd "$DIR_PATH" || exit

echo -e "\n----------------------------------------"

case $LANG_CHOICE in
    1) # Java
        read -rp "Enter Java compiler [default: javac]: " COMPILER
        COMPILER=${COMPILER:-javac}

        # Extract class name (filename without extension)
        CLASS_NAME="${FILE_NAME%.*}"

        # Check if file has a package declaration
        PKG_NAME=$(grep -E '^\s*package\s+' "$FILE_NAME" | sed -E 's/^\s*package\s+([^;]+);.*/\1/' | xargs)

        echo "Compiling with $COMPILER..."

        if [ -n "$PKG_NAME" ]; then
            # Handles package compiling and running from root directory
            if $COMPILER *.java; then
                echo "Compilation successful. Running..."
                echo -e "----------------------------------------\n"
                cd ..
                java "$PKG_NAME.$CLASS_NAME"
            else
                echo "Compilation failed."
            fi
        else
            # Standard execution if no package is present
            if $COMPILER *.java; then
                echo "Compilation successful. Running..."
                echo -e "----------------------------------------\n"
                java "$CLASS_NAME"
            else
                echo "Compilation failed."
            fi
        fi
        ;;

    2) # C
        read -rp "Enter C compiler [default: gcc]: " COMPILER
        COMPILER=${COMPILER:-gcc}

        OUT_NAME="${FILE_NAME%.*}.out"

        echo "Compiling with $COMPILER..."
        if $COMPILER "$FILE_NAME" -o "$OUT_NAME"; then
            echo "Compilation successful. Running..."
            echo -e "----------------------------------------\n"
            ./"$OUT_NAME"
        else
            echo "Compilation failed."
        fi
        ;;

    3) # C++
        read -rp "Enter C++ compiler [default: g++]: " COMPILER
        COMPILER=${COMPILER:-g++}

        OUT_NAME="${FILE_NAME%.*}.out"

        echo "Compiling with $COMPILER..."
        if $COMPILER "$FILE_NAME" -o "$OUT_NAME"; then
            echo "Compilation successful. Running..."
            echo -e "----------------------------------------\n"
            ./"$OUT_NAME"
        else
            echo "Compilation failed."
        fi
        ;;

    4) # Python
        read -rp "Enter Python interpreter [default: python3]: " INTERPRETER
        INTERPRETER=${INTERPRETER:-python3}

        echo "Executing with $INTERPRETER..."
        echo -e "----------------------------------------\n"
        $INTERPRETER "$FILE_NAME"
        ;;

    *)
        echo "Invalid selection."
        exit 1
        ;;
esac
