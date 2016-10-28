I found 143 options in youtube-dl:

```python
def main():
    count = 0
    with open('args.txt', 'r') as stream:
        for line in stream:
            if line[0] == '-':
                count += 1
    print(count)

if __name__ == '__main__':
    main()
```

Looking at some of the options in the "Video Selection"-section of the arguments, it actually looks like I could be used for a crawler/scraper.

However, I have never used it like that. In the past I've used youtube-dl to download conference recordings (such as [Python 3 Metaprogramming](https://www.youtube.com/watch?v=sPiWg5jSoZI) or [Django in Depth](https://www.youtube.com/watch?v=tkwZ1jG3XgA)); to download [MIT OpenCourseWare](https://www.youtube.com/user/MIT) videos which aren't available for torrent on the [Internet Archive](https://archive.org/details/mit_ocw); and even to preserve audio recordings from albums which are no longer available from purchase, or at least able to be found for purchase via a Google search, such as this [worship CD by Heidi Baker and Kimberly Rivera](https://www.youtube.com/watch?v=jwGQKsvSx5c).

The main arguments for youtube-dl are the default (which is none but the URL of the video you wish to download) and `-x` which cuts the audio from the video. youtube-dl always provides me with great formats: _m4a_, _ogg_, _webm_, and _opus_ are pretty common for me. If you aren't familiar with these, they can be _much_ better performing codecs than _mp3_ or _mp4_. I always get the best quality, compared to some "youtube downloader" website you could find on Google; and if I need a specific format, such as for an _mp3 player_, then I can use the Unix `soundconverter` program to convert them.

All-in-all, youtube-dl is a great little piece of software with a lot of functionality and options to help you get done whatever you need; plus the author [does not support piracy](https://github.com/rg3/youtube-dl/blob/master/README.md#can-you-add-support-for-this-anime-video-site-or-site-which-shows-current-movies-for-free), which is awesome.

Cheers.
