# Touchpad Settings

If you have a poorly functioning touchpad such as too fast/too slow you can
edit the file to adjust settings. The full documentation is at: [ftp://www.x.org/pub/X11R7.5/doc/man/man4/synaptics.4.html](ftp://www.x.org/pub/X11R7.5/doc/man/man4/synaptics.4.html)

I have set mine here for an X1 Carbon and it's the best I could get it. The palm
recognition is not too great.

# The harder way of customizing

You can do the following with:

```
xinput --list

# Find your Device Pointer

xinput --list-props <id>

# Find a property to change

xinput --set-prop <id> "Setting NameString" value

```

# Watch All Items Handled

You can see what your mouse is doing with
```
xinput --test id
```

## Read Palm Pressure
If you wanted to check your touchpad pressure, be careful when you do this, you **must** know how to use alt+tab, and get back to where you want!
```
# Have two (2) terminals open
sysclient TouchpadOff=1
./touchpad-settings.sh

# Watch the item
xinput --test id

# When complete, go back and forth to adjust the values, to re-enable:
# Alt+Tab to this file to edit, and TouchpadOff=0
# Or you can type:

synclient TouchpadOff=0
```

---

MIT License

&copy; 2017 Jesse Boyer | <(JREAM)[https://jream.com]>
