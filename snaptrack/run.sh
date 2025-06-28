#!/bin/bash

# SnapTrack v1.1 - Build and Run Script
# This script handles the complete build process and launches the app

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Main script
main() {
    print_status "Starting SnapTrack v1.1 build and run process..."
    
    # Check if we're in the right directory
    if [ ! -f "pubspec.yaml" ]; then
        print_error "pubspec.yaml not found. Please run this script from the snaptrack directory."
        exit 1
    fi
    
    # Set up Flutter path if not already in PATH
    if ! command_exists flutter; then
        print_status "Flutter not found in PATH. Setting up Flutter..."
        export PATH="$PATH:/opt/flutter/bin"
        
        if ! command_exists flutter; then
            print_error "Flutter not found. Please ensure Flutter is installed at /opt/flutter/"
            exit 1
        fi
    fi
    
    print_success "Flutter found: $(flutter --version | head -n 1)"
    
    # Step 1: Clean previous builds
    print_status "Cleaning previous builds..."
    flutter clean
    
    # Step 2: Get dependencies
    print_status "Getting Flutter dependencies..."
    flutter pub get
    
    # Step 3: Generate required files
    print_status "Generating Isar schema files..."
    flutter pub run build_runner build --delete-conflicting-outputs
    
    if [ $? -ne 0 ]; then
        print_error "Code generation failed. Please check the error messages above."
        exit 1
    fi
    
    print_success "Code generation completed successfully!"
    
    # Step 4: Build for Linux
    print_status "Building Linux application..."
    flutter build linux
    
    if [ $? -ne 0 ]; then
        print_error "Build failed. Please check the error messages above."
        exit 1
    fi
    
    print_success "Build completed successfully!"
    
    # Step 5: Check if executable exists
    EXECUTABLE_PATH="./build/linux/x64/release/bundle/snaptrack"
    
    if [ ! -f "$EXECUTABLE_PATH" ]; then
        print_error "Executable not found at $EXECUTABLE_PATH"
        exit 1
    fi
    
    # Step 6: Make executable if needed
    chmod +x "$EXECUTABLE_PATH"
    
    # Step 7: Launch the application
    print_status "Launching SnapTrack v1.1..."
    print_warning "Note: The app currently uses mock AI data. Configure API keys in settings for real analysis."
    
    # Run the application
    "$EXECUTABLE_PATH"
}

# Handle script arguments
case "${1:-}" in
    --build-only)
        print_status "Build-only mode selected. App will not be launched."
        # Run everything except the launch
        main() {
            print_status "Starting SnapTrack v1.1 build process (build-only mode)..."
            
            if [ ! -f "pubspec.yaml" ]; then
                print_error "pubspec.yaml not found. Please run this script from the snaptrack directory."
                exit 1
            fi
            
            if ! command_exists flutter; then
                print_status "Flutter not found in PATH. Setting up Flutter..."
                export PATH="$PATH:/opt/flutter/bin"
                
                if ! command_exists flutter; then
                    print_error "Flutter not found. Please ensure Flutter is installed at /opt/flutter/"
                    exit 1
                fi
            fi
            
            print_success "Flutter found: $(flutter --version | head -n 1)"
            
            print_status "Cleaning previous builds..."
            flutter clean
            
            print_status "Getting Flutter dependencies..."
            flutter pub get
            
            print_status "Generating Isar schema files..."
            flutter pub run build_runner build --delete-conflicting-outputs
            
            if [ $? -ne 0 ]; then
                print_error "Code generation failed. Please check the error messages above."
                exit 1
            fi
            
            print_success "Code generation completed successfully!"
            
            print_status "Building Linux application..."
            flutter build linux
            
            if [ $? -ne 0 ]; then
                print_error "Build failed. Please check the error messages above."
                exit 1
            fi
            
            print_success "Build completed successfully!"
            print_status "Executable created at: ./build/linux/x64/release/bundle/snaptrack"
            print_status "You can now run the app with: ./build/linux/x64/release/bundle/snaptrack"
        }
        main
        ;;
    --run-only)
        print_status "Run-only mode selected. Skipping build process."
        EXECUTABLE_PATH="./build/linux/x64/release/bundle/snaptrack"
        
        if [ ! -f "$EXECUTABLE_PATH" ]; then
            print_error "Executable not found at $EXECUTABLE_PATH"
            print_status "Please run './run.sh' or './run.sh --build-only' first to build the app."
            exit 1
        fi
        
        chmod +x "$EXECUTABLE_PATH"
        print_status "Launching SnapTrack v1.1..."
        "$EXECUTABLE_PATH"
        ;;
    --help|-h)
        echo "SnapTrack v1.1 - Build and Run Script"
        echo ""
        echo "Usage: $0 [option]"
        echo ""
        echo "Options:"
        echo "  (no option)    Build and run the application (default)"
        echo "  --build-only   Build the application but don't launch it"
        echo "  --run-only     Launch existing build without rebuilding"
        echo "  --help, -h     Show this help message"
        echo ""
        echo "Examples:"
        echo "  $0                    # Build and run"
        echo "  $0 --build-only       # Just build"
        echo "  $0 --run-only         # Just run existing build"
        echo ""
        echo "Requirements:"
        echo "  - Flutter SDK (will be set up automatically if at /opt/flutter/)"
        echo "  - Linux desktop environment"
        echo "  - Run from the snaptrack directory"
        ;;
    *)
        main
        ;;
esac