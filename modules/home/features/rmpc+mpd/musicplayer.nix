{ self, inputs, ... }: {
  
  flake.homeModules.musicplayer = {pkgs, ...}: {
    services.mpd = {
      enable = true;
      musicDirectory = "~/Music";
      network = {
        startWhenNeeded = true;
      };	
      extraConfig = ''
        bind_to_address "/run/user/1001/mpd/socket"
        audio_output {
	  type "pipewire"
	  name "My PipeWire Output"
	}
      '';	
    };
    home.packages = with pkgs; [
      yt-dlp
      ffmpeg-full
      mpd
      (python3.withPackages (ps: with ps; [
        mutagen
      ])) 	
    ];
    programs.rmpc = {
      enable = true;
      config = ''
      #![enable(implicit_some)]
      #![enable(unwrap_newtypes)]
      #![enable(unwrap_variant_newtypes)]

        (
            address: "/run/user/1001/mpd/socket",
            password: None,
            theme: None,
            cache_dir: Some("~/Music"),
            on_song_change: None,
            volume_step: 5,
            max_fps: 60,
            scrolloff: 0,
            wrap_navigation: false,
            enable_mouse: true,
            scroll_amount: 1,
            enable_config_hot_reload: true,
            enable_keepalive: true,
            enable_lyrics_hot_reload: false,
            status_update_interval_ms: Some(500),
            rewind_to_start_sec: None,
            keep_state_on_song_change: true,
            reflect_changes_to_playlist: false,
            select_current_song_on_change: false,
            on_exit: None,
            ignore_leading_the: false,
            browser_song_sort: [Disc, Track, Artist, Title],
            directories_sort: SortFormat(group_by_type: true, reverse: false),
            directories_hidden_dirs: [],
            queue_disable_current_item_style_timeout_ms: None,
            album_art: (
                method: Auto,
                max_size_px: (width: 1200, height: 1200),
                disabled_protocols: ["http://", "https://"],
                vertical_align: Center,
                horizontal_align: Center,
            ),
            keybinds: (
                global: {
                    "u":       Update, // update music database
                    "U":       Rescan,
                    ":":       CommandMode,
                    ".":       VolumeUp,
                    ",":       VolumeDown,
                    "s":       Stop,
                    "<Tab>":   NextTab,
                    "<S-Tab>": PreviousTab,
                    "1":       SwitchToTab("Queue"),
                    "2":       SwitchToTab("Playlists"),
                    "3":       SwitchToTab("Library"),
                    "4":       SwitchToTab("Artists"),
                    "F":       SwitchToTab("Search"),
                    "q":       Quit,
                    ">":       NextTrack,
                    "<":       PreviousTrack,
                    "f":       SeekForward,
                    "b":       SeekBack,
                    "p":       TogglePause,
                    "z":       ToggleRepeat,
                    "x":       ToggleRandom,
                    "c":       ToggleConsume,
                    "v":       ToggleSingle,
                    "?":       ShowHelp,
                    "I":       ShowCurrentSongInfo,
                    "O":       ShowOutputs,
                    "P":       ShowDecoders,
                },
                navigation: { // Playlists pane
                    "k":         Up,
                    "j":         Down,
                    "h":         Left,
                    "l":         Right,
                    "<Up>":      Up,
                    "<Down>":    Down,
                    "<Left>":    Left,
                    "<Right>":   Right,
                    "<C-k>":     PaneUp,
                    "<C-j>":     PaneDown,
                    "<C-h>":     PaneLeft,
                    "<C-l>":     PaneRight,
                    "<C-u>":     UpHalf,
                    "<C-d>":     DownHalf,
                    "N":         PreviousResult,
                    "a":         Add, // add song to queue pane
                    "A":         AddAll,
                    "r":         Rename,
                    "n":         NextResult,
                    "g":         Top,
                    "<Space>":   Select,
                    "<C-Space>": InvertSelection,
                    "G":         Bottom,
                    "<CR>":      Confirm,
                    "i":         FocusInput,
                    "/":         EnterSearch,
                    "<C-c>":     Close,
                    "<Esc>":     Close,
                    "J":         MoveDown, // move song up in playlist
                    "K":         MoveUp, // move song down in playlist
                    "D":         Delete,  // delete a song from playlist
                },
                queue: { // queue pane
                    "D":       DeleteAll,
                    "<CR>":    Play,
                    "a":       AddToPlaylist, // add song to playlist from queue pane
                    "d":       Delete, // delete song from queue
                    "i":       ShowInfo,
                    "C":       JumpToCurrent,
                    "<C-s>":   Save, // save current playng queue to new playlist
                },
            ),   
	    search: (
                case_sensitive: false,
                ignore_diacritics: false,
                search_button: false,
                mode: Contains,
                tags: [
                    (value: "any",         label: "Any Tag"),
                    (value: "title",       label: "Title"),
                    (value: "album",       label: "Album"),
                    (value: "artist",      label: "Artist"),
                    (value: "albumartist", label: "Feat."),
                    (value: "filename",    label: "Filename"),
                    (value: "genre",       label: "Genre"),
                ],
            ),
            artists: (
                album_display_mode: SplitByDate,
                album_sort_by: Date,
	    ),
	    current_song: (
	        format: "{title}\n{artist}\n{album}",
		align: Center,
	    ),	
            tabs: [
                (
                    name: "Queue",
                    pane: Split(
                        direction: Horizontal,
                        panes: [
                            (size: "75%", pane: Pane(Queue)),
                            (size: "25%",  
                                    pane: Split(
                                        direction: Vertical,
                                        panes: [
                                            (
                                                    size: "75%",
                                                    borders: "NONE",
                                                    pane: Pane(AlbumArt),
                                            ),
                                        ],
                                    ),
                            ),  
                        ],
                    ),
                ),
                (
                    name: "Playlists",
                    pane: Split(
                        direction: Horizontal,
                        panes: [(size: "100%", borders: "ALL", pane: Pane(Playlists))],
                    ),
                ),
                (
                    name: "Library",
                    pane: Pane(Directories),
                ),
                (
                    name: "Artists",
                    pane: Split(
                        direction: Horizontal,
                        panes: [(size: "100%", borders: "ALL", pane: Pane(Artists))],
                    ),
                ),
                (
                    name: "Search",
                    pane: Split(
                        direction: Horizontal,
                        panes: [(size: "100%", borders: "ALL", pane: Pane(Search))],
                    ),
                ),
	     ],
	  ),  
     '';
    };	
  };  
}
