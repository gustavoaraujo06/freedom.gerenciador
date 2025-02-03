'use client'
import { useEffect, useRef } from 'react'

import {
  CAvatar,
  CButton,
  CCard,
  CCardBody,
  CCardSubtitle,
  CCardTitle,
  CCol,
  CDropdown,
  CDropdownItem,
  CDropdownMenu,
  CDropdownToggle,
  CImage,
  CProgress,
  CRow,
  CTable,
  CTableBody,
  CTableDataCell,
  CTableHead,
  CTableHeaderCell,
  CTableRow,
  CWidgetStatsA,
} from '@coreui/react-pro'
import { CChartBar, CChartLine } from '@coreui/react-chartjs'
import { getStyle } from '@coreui/utils'
import CIcon from '@coreui/icons-react'
import {
  cibGoogle,
  cibFacebook,
  cibLinkedin,
  cifBr,
  cifEs,
  cifFr,
  cifIn,
  cifPl,
  cifUs,
  cibTwitter,
  cilPeople,
  cilUser,
  cilUserFemale,
  cilArrowBottom,
  cilCart,
  cilArrowTop,
  cilUserPlus,
  cilOptions,
  cilCash,
  
} from '@coreui/icons'

import avatar1 from '@/public/images/avatars/1.jpg'
import avatar2 from '@/public/images/avatars/2.jpg'
import avatar3 from '@/public/images/avatars/3.jpg'
import avatar4 from '@/public/images/avatars/4.jpg'
import avatar5 from '@/public/images/avatars/5.jpg'
import avatar6 from '@/public/images/avatars/6.jpg'
import pix from '@/public/images/pix.png';

const Dashboard = () => {
  const chartBartRef = useRef<any>(null)
  const chartLineRef = useRef<any>(null)

  useEffect(() => {
    document.documentElement.addEventListener('ColorSchemeChange', () => {
      if (chartBartRef.current) {
        chartBartRef.current.options.scales.x.grid.color = getStyle(
          '--cui-border-color-translucent',
        )
        chartBartRef.current.options.scales.x.ticks.color = getStyle('--cui-body-color')
        chartBartRef.current.options.scales.y.grid.color = getStyle(
          '--cui-border-color-translucent',
        )
        chartBartRef.current.options.scales.y.ticks.color = getStyle('--cui-body-color')
        chartBartRef.current.update()
      }

      if (chartLineRef.current) {
        chartLineRef.current.data.datasets[0].pointBackgroundColor = getStyle('--cui-primary')
        chartLineRef.current.update()
      }
    })
  }, [chartBartRef, chartLineRef])

  const progressGroupExample1 = [
    { title: 'Segunda-feira', value1: 34, value2: 78 },
    { title: 'Terça-feira', value1: 56, value2: 94 },
    { title: 'Quarta-feira', value1: 12, value2: 67 },
    { title: 'Quinta-feira', value1: 43, value2: 91 },
    { title: 'Sexta-feira', value1: 22, value2: 73 },
    { title: 'Sabado', value1: 53, value2: 82 },
    { title: 'Domingo', value1: 9, value2: 69 },
  ]
  const progressGroupExample3 = [
    { title: 'Diesel', percent: 56, value: '191,235' },
    { title: 'Sementes', percent: 15, value: '51,223' },
    { title: 'Manutenções', percent: 11, value: '37,564' },
    { title: 'Agrotoxicos', percent: 8, value: '27,319' },
  ]

  const tableExample = [
    {
      avatar: { src: avatar2.src, status: 'success' },
      user: {
        name: 'Nome do Malandro',
        role: 'CEO',
        salary: 25000,
      },
      
    },
    {
      avatar: { src: avatar1.src, status: 'warning' },
      user: {
        name: 'Nome do Malandro',
        role: 'Supervisor(a)',
        salary: 5000,
      },
      
    },
    {
      avatar: { src: avatar3.src, status: 'success' },
      user: {
        name: 'Nome do Malandro',
        role: 'Operador(a) de Empilhadeira',
        salary: 3400,
      },
      
    },
    {
      avatar: { src: avatar4.src, status: 'success' },
      user: {
        name: 'Nome do Malandro',
        role: 'Motorista',
        salary: 4500,
      },
      
    },
    {
      avatar: { src: avatar5.src, status: 'success' },
      user: {
        name: 'Nome do Malandro',
        role: 'Protocolista',
        salary: 5000,
      },
      
    },
    {
      avatar: { src: avatar6.src, status: 'success' },
      user: {
        name: 'Nome do Malandro',
        role: 'Auxiliar de Serviços Gerais',
        salary: 3000,
      },
      
    },
  ]

  return (
    <>
      <CRow>
        <CCol xl={4}>
          <CRow>
            <CCol lg={12}>
              <CCard className="overflow-hidden mb-4">
                <CCardBody className="p-4">
                  <CRow>
                    <CCol>
                      <CCardTitle className="fs-4 fw-semibold">Vendas</CCardTitle>
                    </CCol>
                    <CCol className="text-end text-primary fs-4 fw-semibold">R$613.200</CCol>
                  </CRow>
                  <CCardSubtitle className="fw-normal text-body-secondary">
                    Janeiro - Julho 2024
                  </CCardSubtitle>
                </CCardBody>
                <CChartLine
                  className="mt-3"
                  style={{ height: '150px' }}
                  data={{
                    labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho'],
                    datasets: [
                      {
                        label: 'Vendas',
                        backgroundColor: `rgba(${getStyle('--cui-primary-rgb')}, .1)`,
                        borderColor: getStyle('--cui-primary'),
                        borderWidth: 3,
                        data: [78452, 81745, 80746, 45134, 342145, 221728, 40137],
                        fill: true,
                      },
                    ],
                  }}
                  options={{
                    plugins: {
                      legend: {
                        display: false,
                      },
                      tooltip:{
                        callbacks:{
                          label: (context) => {
                            const valor = context.parsed.y || 0;
                            return `R$${valor.toLocaleString('pt-BR')}`;
                          }
                        }
                      }
                    },
                    
                    maintainAspectRatio: false,
                    scales: {
                      x: {
                        display: false,
                      },
                      y: {
                        beginAtZero: true,
                        display: false,
                      },
                    },
                    elements: {
                      line: {
                        borderWidth: 2,
                        tension: 0.4,
                      },
                      point: {
                        radius: 0,
                        hitRadius: 10,
                        hoverRadius: 4,
                      },
                    },
                  }}
                />
              </CCard>
            </CCol>
            <CCol sm={6}>
              <CCard className="mb-4">
                <CCardBody>
                  <div className="d-flex justify-content-between">
                    <CCardTitle as="h6" className="text-body-secondary text-truncate">
                      Clientes
                    </CCardTitle>
                    <div className="bg-primary bg-opacity-25 text-primary rounded p-2 ms-2">
                      <CIcon icon={cilPeople} size="xl" />
                    </div>
                  </div>
                  <div className="fs-4 fw-semibold pb-3">44.725</div>
                  <small className="text-danger">
                    (-12.4% <CIcon icon={cilArrowBottom} />)
                  </small>
                </CCardBody>
              </CCard>
            </CCol>
            <CCol sm={6}>
              <CCard className="mb-4">
                <CCardBody>
                  <div className="d-flex justify-content-between">
                    <CCardTitle as="h6" className="text-body-secondary text-truncate">
                      Pedidos
                    </CCardTitle>
                    <div className="bg-primary bg-opacity-25 text-primary rounded p-2 ms-2">
                      <CIcon icon={cilCart} size="xl" />
                    </div>
                  </div>
                  <div className="fs-4 fw-semibold pb-3">385</div>
                  <small className="text-success">
                    (17.2% <CIcon icon={cilArrowTop} />)
                  </small>
                </CCardBody>
              </CCard>
            </CCol>
          </CRow>
        </CCol>
        <CCol xl={8}>
          <CCard className="mb-4">
            <CCardBody className="p-4">
              <CCardTitle className="fs-4 fw-semibold">Fluxo de Caixa</CCardTitle>
              <CCardSubtitle
                className="fw-normal text-body-secondary"
                style={{ marginBottom: '40px' }}
              >
                Janeiro 01, 2024 - Dezembro 31, 2024
              </CCardSubtitle>
              <CChartBar
                ref={chartBartRef}
                data={{
                  labels: [
                    'Jan',
                    'Fev',
                    'Mar',
                    'Abr',
                    'Mai',
                    'Jun',
                    'Jul',
                    'Ago',
                    'Set',
                    'Out',
                    'Nov',
                    'Dez',
                  ],
                  datasets: [
                    {
                      label: 'Entradas',
                      backgroundColor: getStyle('--cui-primary'),
                      borderRadius: 6,
                      borderSkipped: false,
                      data: [
                        320345.0,  // Jan
                        456780.0,  // Fev
                        398120.0,  // Mar
                        563450.0,  // Abr
                        611230.0,  // Mai
                        900500.0,  // Jun
                        1250000.0, // Jul
                        935400.0,  // Ago
                        1025400.0, // Set
                        1184500.0, // Out
                        950230.0,  // Nov
                        1356700.0, // Dez
                      ],
                      barPercentage: 0.6,
                      categoryPercentage: 0.5,
                    },
                    {
                      label: 'Saidas',
                      backgroundColor: getStyle('--cui-gray-200'),
                      borderRadius: 6,
                      borderSkipped: false,
                      data: [
                        150230.0,  // Jan
                        190000.0,  // Fev
                        235600.0,  // Mar
                        290800.0,  // Abr
                        325000.0,  // Mai
                        450700.0,  // Jun
                        620000.0,  // Jul
                        484300.0,  // Ago
                        600500.0,  // Set
                        820100.0,  // Out
                        700900.0,  // Nov
                        940000.0,  // Dez
                      ],
                      barPercentage: 0.6,
                      categoryPercentage: 0.5,
                    },
                  ],
                }}
                options={{
                  maintainAspectRatio: false,
                  plugins: {
                    legend: {
                      display: false,
                    },
                    tooltip:{
                      callbacks:{
                        label: (context) => {
                          const valor = context.parsed.y || 0;
                          return `R$ ${valor.toLocaleString('pt-BR')}`;
                        }
                      }
                    }
                  },
                  scales: {
                    x: {
                      border: {
                        display: false,
                      },
                      grid: {
                        color: getStyle('--cui-border-color-translucent'),
                        display: false,
                        drawTicks: false,
                      },
                      ticks: {
                        color: getStyle('--cui-body-color'),
                        font: {
                          size: 14,
                        },
                        padding: 16,
                      },
                    },
                    y: {
                      
                      beginAtZero: true,
                      border: {
                        dash: [2, 4],
                        display: false,
                      },
                      grid: {
                        color: getStyle('--cui-border-color-translucent'),
                      },
                      ticks: {
                        callback: function (value) {
                          return `R$ ${Number(value).toLocaleString('pt-BR')}`
                        },
                        color: getStyle('--cui-body-color'),
                        font: {
                          size: 14,
                        },
                        maxTicksLimit: 5,
                        padding: 16,
                        stepSize: Math.ceil(100 / 4),
                      },
                    },
                  },
                }}
                style={{ height: '300px' }}
              />
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
      <CRow>
        <CCol xl={9}>
          <CCard className="mb-4">
            <CCardBody className="p-4">
              <CRow>
                <CCol>
                  <CCardTitle className="fs-4 fw-semibold">Funcionarios</CCardTitle>
                  <CCardSubtitle className="fw-normal text-body-secondary mb-4">
                    6 Funcionarios Registrados
                  </CCardSubtitle>
                </CCol>
                <CCol xs="auto" className="ms-auto">
                  <CButton color="secondary">
                    <CIcon icon={cilUserPlus} className="me-2" />
                    Adicionar Funcionario
                  </CButton>
                </CCol>
              </CRow>
              <CTable align="middle" className="mb-0" hover responsive>
                <CTableHead className="fw-semibold text-body-secondary">
                  <CTableRow>
                    <CTableHeaderCell className="text-center">
                      <CIcon icon={cilPeople} />
                    </CTableHeaderCell>
                    <CTableHeaderCell>Funcionario</CTableHeaderCell>
                    <CTableHeaderCell className="text-center">Salario</CTableHeaderCell>
                    <CTableHeaderCell>Pagar</CTableHeaderCell>
                  </CTableRow>
                </CTableHead>
                <CTableBody>
                  {tableExample.map((item, index) => (
                    <CTableRow v-for="item in tableItems" key={index}>
                      <CTableDataCell className="text-center">
                        <CAvatar size="md" src={item.avatar.src} status={item.avatar.status} />
                      </CTableDataCell>
                      <CTableDataCell>
                        <div>{item.user.name}</div>
                        <div className="small text-body-secondary text-nowrap">
                          <span>{item.user.role}</span>
                        </div>
                      </CTableDataCell>
                      <CTableDataCell className="text-center">
                        <div className="fw-semibold text-nowrap">{item.user.salary.toLocaleString('pt-BR', {
                          style: 'currency',
                          currency: 'BRL',
                        })}</div>
                      </CTableDataCell>
                      <CTableDataCell className='p-0'>
                        <CButton size="sm" className='m-0'>
                          <CImage src={pix.src} height={40} width={40}></CImage>
                        </CButton>
                      </CTableDataCell>
                    </CTableRow>
                  ))}
                </CTableBody>
              </CTable>
            </CCardBody>
          </CCard>
        </CCol>
        <CCol xl={3}>
          <CRow>
            <CCol md={4} xl={12}>
              <CWidgetStatsA
                className="mb-4"
                color="primary-gradient"
                value={
                  <>
                    260{' '}
                    <span className="fs-6 fw-normal">
                      (-12.4% <CIcon icon={cilArrowBottom} />)
                    </span>
                  </>
                }
                title="Clientes"
                action={
                  <CDropdown alignment="end">
                    <CDropdownToggle color="transparent" caret={false} className="p-0">
                      <CIcon icon={cilOptions} className="text-high-emphasis-inverse" />
                    </CDropdownToggle>
                    <CDropdownMenu>
                      <CDropdownItem>Açao</CDropdownItem>
                      <CDropdownItem>Outra Açao</CDropdownItem>
                      <CDropdownItem>Alguma Coisa Aqui...</CDropdownItem>
                      <CDropdownItem disabled>Açao Desabilitada</CDropdownItem>
                    </CDropdownMenu>
                  </CDropdown>
                }
                chart={
                  <CChartLine
                    className="mt-3 mx-3"
                    style={{ height: '85px' }}
                    data={{
                      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                      datasets: [
                        {
                          label: 'My First dataset',
                          backgroundColor: 'transparent',
                          borderColor: 'rgba(255,255,255,.55)',
                          pointBackgroundColor: getStyle('--cui-primary'),
                          data: [65, 59, 84, 84, 51, 55, 40],
                        },
                      ],
                    }}
                    options={{
                      plugins: {
                        legend: {
                          display: false,
                        },
                      },
                      maintainAspectRatio: false,
                      scales: {
                        x: {
                          border: {
                            display: false,
                          },
                          grid: {
                            display: false,
                          },
                          ticks: {
                            display: false,
                          },
                        },
                        y: {
                          min: 30,
                          max: 89,
                          display: false,
                          grid: {
                            display: false,
                          },
                          ticks: {
                            display: false,
                          },
                        },
                      },
                      elements: {
                        line: {
                          borderWidth: 1,
                          tension: 0.4,
                        },
                        point: {
                          radius: 4,
                          hitRadius: 10,
                          hoverRadius: 4,
                        },
                      },
                    }}
                  />
                }
              />
            </CCol>
            <CCol md={4} xl={12}>
              <CWidgetStatsA
                className="mb-4"
                color="warning-gradient"
                value={
                  <>
                    2.49%{' '}
                    <span className="fs-6 fw-normal">
                      (84.7% <CIcon icon={cilArrowTop} />)
                    </span>
                  </>
                }
                title="Taxa de Conversão"
                action={
                  <CDropdown alignment="end">
                    <CDropdownToggle color="transparent" caret={false} className="p-0">
                      <CIcon icon={cilOptions} className="text-high-emphasis-inverse" />
                    </CDropdownToggle>
                    <CDropdownMenu>
                      <CDropdownItem>Açao</CDropdownItem>
                      <CDropdownItem>Outra Açao</CDropdownItem>
                      <CDropdownItem>Alguma Outra Coisa...</CDropdownItem>
                      <CDropdownItem disabled>Açao Desabilitada</CDropdownItem>
                    </CDropdownMenu>
                  </CDropdown>
                }
                chart={
                  <CChartLine
                    className="mt-3"
                    style={{ height: '85px' }}
                    data={{
                      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                      datasets: [
                        {
                          label: 'My First dataset',
                          backgroundColor: 'rgba(255,255,255,.2)',
                          borderColor: 'rgba(255,255,255,.55)',
                          data: [78, 81, 80, 45, 34, 12, 40],
                          fill: true,
                        },
                      ],
                    }}
                    options={{
                      plugins: {
                        legend: {
                          display: false,
                        },
                      },
                      maintainAspectRatio: false,
                      scales: {
                        x: {
                          display: false,
                        },
                        y: {
                          display: false,
                        },
                      },
                      elements: {
                        line: {
                          borderWidth: 2,
                          tension: 0.4,
                        },
                        point: {
                          radius: 0,
                          hitRadius: 10,
                          hoverRadius: 4,
                        },
                      },
                    }}
                  />
                }
              />
            </CCol>
            <CCol md={4} xl={12}>
              <CWidgetStatsA
                className="mb-4"
                color="danger-gradient"
                value={
                  <>
                    44K{' '}
                    <span className="fs-6 fw-normal">
                      (-23.6% <CIcon icon={cilArrowBottom} />)
                    </span>
                  </>
                }
                title="Pedidos"
                action={
                  <CDropdown alignment="end">
                    <CDropdownToggle color="transparent" caret={false} className="p-0">
                      <CIcon icon={cilOptions} className="text-high-emphasis-inverse" />
                    </CDropdownToggle>
                    <CDropdownMenu>
                      <CDropdownItem>Action</CDropdownItem>
                      <CDropdownItem>Another action</CDropdownItem>
                      <CDropdownItem>Something else here...</CDropdownItem>
                      <CDropdownItem disabled>Disabled action</CDropdownItem>
                    </CDropdownMenu>
                  </CDropdown>
                }
                chart={
                  <CChartBar
                    className="mt-3 mx-3"
                    style={{ height: '85px' }}
                    data={{
                      labels: [
                        'January',
                        'February',
                        'March',
                        'April',
                        'May',
                        'June',
                        'July',
                        'August',
                        'September',
                        'October',
                        'November',
                        'December',
                        'January',
                        'February',
                        'March',
                        'April',
                      ],
                      datasets: [
                        {
                          label: 'My First dataset',
                          backgroundColor: 'rgba(255,255,255,.2)',
                          borderColor: 'rgba(255,255,255,.55)',
                          data: [78, 81, 80, 45, 34, 12, 40, 85, 65, 23, 12, 98, 34, 84, 67, 82],
                          barPercentage: 0.6,
                        },
                      ],
                    }}
                    options={{
                      maintainAspectRatio: false,
                      plugins: {
                        legend: {
                          display: false,
                        },
                      },
                      scales: {
                        x: {
                          grid: {
                            display: false,
                            drawTicks: false,
                          },
                          ticks: {
                            display: false,
                          },
                        },
                        y: {
                          border: {
                            display: false,
                          },
                          grid: {
                            display: false,
                            drawTicks: false,
                          },
                          ticks: {
                            display: false,
                          },
                        },
                      },
                    }}
                  />
                }
              />
            </CCol>
          </CRow>
        </CCol>
      </CRow>
      <CRow>
        <CCol xs>
          <CCard className="mb-4">
            <CCardBody className="p-4">
              <CCardTitle className="fs-4 fw-semibold">Gastos</CCardTitle>
              <CCardSubtitle className="fw-normal text-body-secondary border-bottom mb-3 pb-4">
                Esse Mês
              </CCardSubtitle>
              <CRow>
                <CCol xs={12} md={6} xl={6}>
                  <CRow>
                    <CCol xs={6}>
                      <div className="border-start border-start-4 border-start-info py-1 px-3 mb-3">
                        <div className="text-body-secondary text-truncate small">Realizado</div>
                        <div className="fs-5 fw-semibold">R$ 9.983</div>
                      </div>
                    </CCol>
                    <CCol xs={6}>
                      <div className="border-start border-start-4 border-start-danger py-1 px-3 mb-3">
                        <div className="text-body-secondary text-truncate small">
                          Orçado
                        </div>
                        <div className="fs-5 fw-semibold">R$ 12.000</div>
                      </div>
                    </CCol>
                  </CRow>
                  <div className="border-top mb-4" />
                  {progressGroupExample1.map((item, index) => (
                    <div className="progress-group mb-4" key={index}>
                      <div className="progress-group-prepend">
                        <span className="text-body-secondary small">{item.title}</span>
                      </div>
                      <div className="progress-group-bars">
                        <CProgress thin color="info-gradient" value={item.value1} />
                        <CProgress thin color="danger-gradient" value={item.value2} />
                      </div>
                    </div>
                  ))}
                </CCol>
                <CCol xs={12} md={6} xl={6}>
                  <CRow>
                    <CCol xs={6}>
                      <div className="border-start border-start-4 border-start-warning py-1 px-3 mb-3">
                        <div className="text-body-secondary text-truncate small">Bruto</div>
                        <div className="fs-5 fw-semibold">R$ 78.623</div>
                      </div>
                    </CCol>
                    <CCol xs={6}>
                      <div className="border-start border-start-4 border-start-success py-1 px-3 mb-3">
                        <div className="text-body-secondary text-truncate small">Liquido</div>
                        <div className="fs-5 fw-semibold">R$ 49.123</div>
                      </div>
                    </CCol>
                  </CRow>

                  {progressGroupExample3.map((item, index) => (
                    <div className="progress-group" key={index}>
                      <div className="progress-group-header">
                        <span>{item.title}</span>
                        <span className="ms-auto fw-semibold">
                          {'R$'}{item.value}{' '}
                          <span className="text-body-secondary small">({item.percent}%)</span>
                        </span>
                      </div>
                      <div className="progress-group-bars">
                        <CProgress thin color="success-gradient" value={item.percent} />
                      </div>
                    </div>
                  ))}
                </CCol>
              </CRow>
              <br />
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </>
  )
}

export default Dashboard
