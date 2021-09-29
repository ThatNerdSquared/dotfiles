// the refresh frequency in milliseconds
export const refreshFrequency = 60000;

// the CSS style for this widget, written using Emotion
// https://emotion.sh/
export const className =`
	display: flex;
	align-items: center;
	justify-content: center;
	top: 15%;
	right: 0;
	left: 0;
	margin: auto;

	width: 380px;
	height: 235px;

	background-color: rgba(183, 183, 183, 0.4);
	-webkit-backdrop-filter: blur(1px);

	border: 2px solid #fff;
	border-radius: 1px;
	line-height: 1.5;

	p {
		font-size: 96px;
		color: #ffffff;
		font-family: Orbitron;
		font-weight: 300;
		max-width: 50%;
	}
`

// render gets called after the shell command has executed. The command's output
// is passed in as a string.
export const render = ({output}) => {
	let date = new Date()
	let hour = date.getHours()
	let mins = date.getMinutes()
	let h = hour.toString()
	h.length == 1 ? h = "0" + h : null
	let m = mins.toString()
	m.length == 1 ? m = "0" + m : null
	return (
		<div>
			<p>{h}:{m}</p>
		</div>
	)
}
