ARG buildno 
ARG tag


FROM python:3.7-alpine
ARG buildno
ARG tag


WORKDIR /code
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
RUN echo "Building ${buildno} using tag ${tag}"
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
RUN echo "Building ${buildno} using tag ${tag}"
CMD ["flask", "run"]
