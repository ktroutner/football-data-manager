import React from "react"
import Chart from "react-apexcharts"

type Team = {
  name: string
  color: string
}

type DataPoint = {
  x: number
  y: number
}

type TeamStatistics = {
  team: Team
  data: DataPoint[]
}

type Props = {
  statistics: TeamStatistics[]
}

const TeamStatisticsGraph = (props: Props) => {
  const options = {
    chart: {
      foreColor: "#6D6D6D",
    },
    colors: props.statistics.map((statistic) => {
      return statistic.team.color
    }),
    grid: {
      borderColor: "#6D6D6D",
    },
    xaxis: {
      type: "category",
    } as ApexXAxis,
  }

  const series = props.statistics.map((statistic) => {
    return {
      name: statistic.team.name,
      data: statistic.data,
    }
  })

  return (
    <>
      <Chart options={options} series={series} type="line" height="380" />
    </>
  )
}
export default TeamStatisticsGraph
