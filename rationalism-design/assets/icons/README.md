# Icon Library — kimi-widget set (105 glyphs)

Fill-style UI glyph set, uniform 24×24 grid, all `currentColor` (inherits host text color).
Snapshot of the kimi-widget icon set, frozen 2026-08; upstream updates do not flow in
automatically — refresh by re-copying when needed.

## Copyright & License

Copyright © Moonshot AI (月之暗面 / Kimi). **All rights reserved.**

This directory is a snapshot of Kimi's product UI icon set, not an original work of this
repository. It is **not** covered by the repository's MIT license (see
[NOTICE.md](../../../NOTICE.md) at the repo root) and is included for personal learning
and research only — do not redistribute these files separately or use them in any product
without the rights holder's permission.

## Usage rules (stacked on `../../references/icons.md`)

- **Inline the SVG** into the page; never reference these files at runtime (zero-dependency rule).
- Files hardcode `width="24" height="24"`. Override both attributes — or delete them and size
  via CSS — to match the host context (16px inline / 16–20px in buttons / 20–24px standalone).
- Add a11y attributes at consumption time: `aria-hidden="true"` next to text labels;
  `aria-label` (or visually hidden text) on icon-only buttons.
- The family is fill-based: keep fills, don't convert to strokes. New hand-drawn additions must
  match this fill style and the 24×24 grid.

## Index

### Actions (编辑与操作)
Add, Plus, Minus, Check, Close, Copy, Create, Delete, Edit, Enter, Move, Pin, Refresh, Redo,
Save, Search, Magnify, Select, Send_a, Switch, Change, Undo, Update, Locate, Setting, Share,
Download, Upload, Link, Bookmark

### Wayfinding (导航)
Left, Right, Up, Down, LeftRight, UpDown, UpperRight, GoBack, Next, Previous, Expand, Collapse,
Unfold, Minify, FullScreen, More, ViewAll, Catalog, List

### State glyphs (状态)
CheckboxEmpty, CheckboxIn, Dot, AllSelected, MultiSelected, Completed, Normal, Bad, Ban, Error,
Warning, Exclamation, Info, Question, Safe, LoadingRight, LoadingDone

### Media (媒体)
Play, Pause, Stop, VolOn, VolOff, Music, Video, Image, Browser

### Content & objects (内容与对象)
Document, DocDone, Folder, FolderOpen, Clip, Comment, Message, Notification, Profile, Group,
History, Task, Todo, Text, Code, MathFormula, Diagram, Histogram, Linechart, Tabular, Data,
Tag, Desktop, Mobile, DarkMode, LightMode, Like, Dislike, Smile, Translate
