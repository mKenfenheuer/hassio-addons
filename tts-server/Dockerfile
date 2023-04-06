FROM python:3.10-slim

RUN python --version
RUN pip install TTS
RUN apt update
RUN apt install -y espeak
RUN tts --model_name tts_models/de/thorsten/tacotron2-DDC --out_path output.wav --text "Das ist ein Test."
RUN rm output.wav
RUN pip install Flask
COPY . .

CMD ["/bin/sh", "-c", "python main.py --model_name tts_models/de/thorsten/tacotron2-DDC"]
EXPOSE 5002