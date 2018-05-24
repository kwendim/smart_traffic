#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/kidus/Desktop/smart_traffic/src/ros_arduino_python"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/kidus/Desktop/smart_traffic/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/kidus/Desktop/smart_traffic/install/lib/python2.7/dist-packages:/home/kidus/Desktop/smart_traffic/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/kidus/Desktop/smart_traffic/build" \
    "/usr/bin/python" \
    "/home/kidus/Desktop/smart_traffic/src/ros_arduino_python/setup.py" \
    build --build-base "/home/kidus/Desktop/smart_traffic/build/ros_arduino_python" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/kidus/Desktop/smart_traffic/install" --install-scripts="/home/kidus/Desktop/smart_traffic/install/bin"
