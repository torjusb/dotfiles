from subprocess import check_output

def spotify(pl):
    track = check_output('spotify-current-track').strip()
    return track
